# Export Plugin
module.exports = (BasePlugin) ->

    _ = require "underscore"
    tmp = require "tmp"
    fs = require "fs"
    exec = require("child_process").exec
    storage = require "node-persist"
    moment = require "moment"
    escape = require "escape-html"

    # ------------ Globals ------------
    self = null
    docpad = null
    config = null
    github = null
    opts = null
    categories = null
    resources = {}
    renderDone = false

    # Define Plugin
    class resources extends BasePlugin
        # ------------ Class Globals ------------

        name: 'resources'

        # ------------ Constructor ------------

        constructor: (_opts) ->
            super _opts

            self = @
            docpad = @docpad
            config = @config

            storage.initSync()
            # Dev: effectively disable cache
            storage.removeItem("lastUpdate")

            GitHubApi = require("github")
            github = new GitHubApi version: "3.0.0"

            github.authenticate
                type: "oauth"
                key: process.env.GITHUB_USERID
                secret: process.env.GITHUB_SECRET

        # ------------ Event Hooks ------------

        extendCollections: ->
            collection = docpad.getFiles(
                relativeDirPath: $startsWith: "resources/"
                resource: $exists: true
                isPagedAuto: $ne: true
            , [title:1])
            docpad.setCollection("resources", collection)

            collection = docpad.getFiles(
                relativeOutDirPath: "resources"
                category: $exists: true
                basename: $ne: "index"
                isPagedAuto: $ne: true
            , [title:1])
            docpad.setCollection("resource-categories", collection)

            categories = config.categories unless categories
            for category in categories
                nameClean = @cleanString category.name
                collection = docpad.getFiles(
                    relativeOutDirPath: "resources/#{nameClean}"
                    resource: $exists: true
                    isPagedAuto: $ne: true
                , [title:1])
                docpad.setCollection("resources-#{nameClean}", collection)

            @

        populateCollections: (_opts,next) ->
            opts = _opts

            docpad.log('info', "Importing Resources...")

            # Fetch categories and resources
            categories = config.categories
            @async categories, null, @fetchCategory, ->
                storage.setItem('lastUpdate', moment().valueOf())
                self.async categories, null, self.createCategory, ->
                    self.async categories, null, (index, category, opts, _next) ->
                        self.async category.resources, category, self.createResource, _next
                    , next

            @

        # ------------ Generators ------------

        fetchCategory: (index, category, opts, next) ->
            category.nameClean = self.cleanString(category.name)
            
            category.resources = storage.getItem(category.name + 'resources') || {}
            category.resourceCount = storage.getItem(category.name + 'resourceCount') || 0
            catResources = require(config.databasesPath + category.resource)
            repositories = []
            meta = {}

            for title, resource of catResources
                if (typeof resource) is "string"
                    resource = resource.split('/').slice(-2).join('/')
                    repositories.push "repo:" + resource
                    meta[resource.toLowerCase()] = {title: title}
                else if resource.html_url
                    fullName = resource.html_url.split('/').slice(-2).join('/')
                    repositories.push "repo:" + fullName
                    resource.title = title unless resource.title
                    meta[fullName.toLowerCase()] = resource
                else
                    if resource.readme and resource.readme.content
                        ((_resource) ->
                            self.markup _resource.readme.content, "md", (content) ->
                                _resource.readme.content = content
                        ).call(self, resource)
                            
                    resource.title = title
                    resource.name = title
                    resource.releases = false
                    category.resourceCount++ unless category.resources[title]
                    category.resources[title] = resource
                    resources[title] = resource

            return next() unless repositories.length

            date = moment(storage.getItem('lastUpdate') || 0).subtract('days', 1).format("YYYY-MM-DD")
            query = {q: repositories.join(' ') + " fork:true pushed:>" + date}
            github.search.repos query, (err, res) ->
                if err
                    docpad.log "error", "Error while searching for repos in category #{category.name}"
                    docpad.log "error", err
                    return next()

                self.async res.items, {category: category, meta: meta}, self.fetchResource, ->
                    storage.setItem(category.name + 'resources', category.resources)
                    storage.setItem(category.name + 'resourceCount', category.resourceCount)
                    next()


        fetchResource: (id, resource, opts, next) ->
            #return next() # DEV - use cache
            if opts.meta[resource.full_name.toLowerCase()]
                resource = _.extend(resource, opts.meta[resource.full_name.toLowerCase()])
            else
                docpad.log "error", "Meta key not found: #{resource.full_name}"
            @fetchReadme id, resource, opts, ->
                self.fetchReleases(id, resource, opts, next)

        fetchReadme: (id, resource, opts, next) ->
            # Retrieve Readme
            github.repos.getReadme {user: resource.owner.login, repo: resource.name}, (err, res) ->
                if err
                    docpad.log "error", "Error while retrieving readme for #{resource.full_name}"
                    docpad.log "error", err
                    return next()

                resource.readme = res
                resource.readme.content = new Buffer(resource.readme.content, 'base64').toString()

                # Parse readme
                format = resource.readme.name.split(".").slice(-1)[0]
                self.markup resource.readme.content, format, (content) ->
                    urlPrefix = 'https://raw.github.com/'+resource.full_name+'/master/'
                    content = content.replace(/((?:href|src)=(?:"|'))(?![a-z]*?\:\/\/)/g, '$1' + urlPrefix)
                    resource.readme.content = content

                    next()

        fetchReleases: (id, resource, opts, next) ->
            {category} = opts
            msg = {user: resource.owner.login, repo:resource.name}
            github.repos.getReleases(msg, (err, releases) ->
                if err
                    docpad.log "error", "Error while retrieving release for #{resource.full_name}"
                    docpad.log "error", err
                    return next()
                
                resource.download_count = 0;

                for release in releases
                    for asset in release.assets
                        resource.download_count += asset.download_count

                resource.releases = releases
                category.resourceCount++ unless category.resources[resource.title]
                category.resources[resource.title] = resource
                resources[resource.title] = resource

                next()
            )
        # ------------ Renderers ------------

        createCategory: (index, category, o, next) ->
            filename = category.nameClean + ".html.ect"
            relativePath = "resources/" + filename
            category.url = docpad.getConfig().templateData.site.url + category.nameClean
            attr =
                meta:
                    title: category.name
                    nameClean: category.nameClean
                    relativePath: relativePath
                    resources: resources
                    category: category
                    categories: categories
                    _categoryName: category.name
                    sort: category.sort
                data: "<%- @partial('"+config.categoryTemplate+"', @) %>"

            document = docpad.getFile({_categoryName:category.name})
            if document?
                document.set attr
            else
                document = docpad.createDocument attr
                
            config.injectCategoryDocumentHelper?.call(self, document)

            docpad.log "debug", "Loading category document #{category.name}"
            document.action "load", (err) ->
                if err
                    docpad.log "error", "Error while loading category document #{category.name}"
                    docpad.log "error", err
                else
                    docpad.addModel?(document) or docpad.getDatabase().add(document)
                    
                next()

        createResource: (title, resource, category, next) ->
            username = self.cleanString resource.owner.login
            filename = username + "--" + self.cleanString(resource.title) + ".html.ect"
            relativePath = "resources/" + category.nameClean + "/" + filename 

            attr =
                meta:
                    title: resource.title
                    relativePath: relativePath
                    resource: resource
                    category: category
                    categories: categories
                    _resourceName: resource.name
                    date: resource.pushed_at || resource.updated_at
                data: "<%- @partial('"+config.resourceTemplate+"', @) %>"

            document = docpad.getFile({_resourceName:resource.name})
            if document?
                document.set attr
            else
                document = docpad.createDocument attr

            config.injectResourceDocumentHelper?.call(self, document)

            docpad.log "debug", "Loading resource document #{resource.name}:#{resource.title}"
            document.action "load", (err) ->
                #console.log document.relativeOutDirPath
                if err
                    docpad.log "error", "Error while loading resource document #{resource.title}"
                    docpad.log "error", err
                else
                    docpad.addModel?(document) or docpad.getDatabase().add(document)

                next()

        # ------------ Helpers ------------

        markup: (contents, format, callback) ->
            text = ["readme", "txt", "text", ""]
            if text.indexOf(format.toLowerCase()) != -1
                return callback("<pre>"+escape(contents)+"</pre>")
            
            tmp.file {postfix: "." + format}, (err, path, fd) ->
                fs.writeFile path, contents, (err) ->
                    return docpad.log "error", "Error writing temp file for markup" if err

                    exec "github-markup " + path, (err, stdout, stderr) ->
                        if err
                            docpad.log("error", err)
                            callback("<pre>"+escape(contents)+"</pre>")
                        else
                            callback(stdout)

        cleanString: (str) ->
            str = str.replace(/\s*/g, '')
            str = str.replace(/[^A-Za-z0-9-]/g, '')
            str.toLowerCase()

        async: (arr, opts, fn, next) ->
            responses = 0
            length = 0
            
            fallback = true
            _fn = (k,v) ->
                length++
                fallback = false
                setTimeout ->
                    fn.call(self, k, v, opts, (res) ->
                        v = res
                        next() if ++responses is length
                    )
                ,0


            _fn(k,v) for k,v of arr

            next() if fallback
