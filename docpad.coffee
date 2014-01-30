_ = require 'underscore'
{requireFresh} = require 'requirefresh'

docpadConfig = {

    # Optimization
    regenerateDelay: 50
    watchOptions:
        catchupDelay: 0

    # Paths
    documentsPaths: [
        'documents',
        'pages'
    ]
    layoutsPaths: [  # default
        'templates/layouts'
    ]
    ignoreCustomPatterns: /public\/vendor|src\/databases|\/_/

    # Default Env
    env: "development"

    templateData:

        _: _

        db:
            header: requireFresh(__dirname + '/src/databases/header.coffee')
            footer: requireFresh(__dirname + '/src/databases/footer.coffee')
            addons: requireFresh(__dirname + '/src/databases/addons.coffee')
            placeholders: requireFresh(__dirname + '/src/databases/placeholders.coffee')

        site:
            url: "/"
            title: "Komodo IDE"
            description: """

                """
            keywords: """

                """

        getPreparedTitle: ->
            if @document.title then "#{@document.title} | #{@site.title}" else @site.title

        getPreparedDescription: ->
            @document.description or @site.description

        getPreparedKeywords: ->
            @site.keywords.concat(@document.keywords or []).join(', ')

        getGruntedStyles: ->
            styles = []
            gruntConfig = require('./grunt-config.json')

            if docpad.getEnvironment() is "development"
                styles = _.flatten gruntConfig.cssmin.combine.files
            else
                minify = gruntConfig.cssmin.minify
                _.each minify.src, (value) ->
                    styles.push minify.cwd + value.replace(/.css$/, minify.ext)

            site = @site
            _.map styles, (value) ->
                site.url + value.replace 'out/', ''

        getGruntedScripts: ->
            scripts = []
            gruntConfig = require('./grunt-config.json')

            if docpad.getEnvironment() is "development"
                scripts = _.flatten gruntConfig.uglify.scripts.files
            else
                scripts = _.keys gruntConfig.uglify.scripts.files

            site = @site
            _.map scripts, (value) ->
                site.url + value.replace 'out/', ''

        getAsList: (ob, classAttr = "") ->
            site = @site
            latestConfig = docpad.getConfig()
            imgPath = @site.url + "images/"

            r = ['<ul class="' + (classAttr) + '">']
            _.each ob, (value, key) ->

                r.push '<li><a href="' + (value.link || site.url + value.name.toLowerCase() + ".html") +
                            '" title="' + value.name +
                            '" target="' + (value.target || "_self") + '">'
                r.push '<img src="' + imgPath + value.img + '"/>' unless ! value.img
                r.push '<span class="link-name">' + value.name + '</span>'
                r.push latestConfig.templateData.getAsList(value.sub) unless ! value.sub
                r.push '</a></li>'

            r.push "</ul>"
            r.join("")

    environments:
        development:
            ignoreCustomPatterns: /public\/vendor/
            templateData:
                site:
                    url: "/"
                youtubeFeeds:
                    screencasts: requireFresh(__dirname + '/src/databases/placeholders.coffee').screencasts
            plugins:
                youtubefeed:
                    dontParse: ['screencasts']

        static: # ghpages
            templateData:
                site:
                    url: "/"


    collections:
        splash: ->
            @getCollection('documents').findAllLive({relativeOutDirPath:'splash'}, [basename: 1])
        blog: ->
            @getCollection('documents').findAllLive({relativeOutDirPath:/blog[\/\\]\w+/}, [date: -1])

    plugins:
        ghpages:
            deployRemote: 'origin'
            deployBranch: 'gh-pages'

        youtubefeed:
            feeds: [
                name: "screencasts"
                url: "http://gdata.youtube.com/feeds/api/playlists/PLItFfEv4fl3uW7T8-BC_Wb0HXZoH__pIs"
                outFilename: "screencast.html.eco"
                outPath: "screencasts"
            ]
        sass:
            requireLibraries: [
                'compass'
                'compass-normalize'
            ]
        moment:
            formats: [
                {raw: 'date', format: 'MMMM Do, YYYY', formatted: 'humanDate'}
            ]
        robotskirt:
            highlight: (code, lang)->
                tags = { '&': '&amp;', '<': '&lt;', '>': '&gt;' }
                code = code.replace /[&<>]/g, (tag) -> tags[tag] || tag
                if lang
                    return '<pre><code class="hljs ' + lang + '">' + code + '</code></pre>';
                else
                    return '<pre><code>' + code + '</code></pre>';
        partials:
            partialsPath: 'templates'

    events:

        # Write After
        # Used to minify our assets with grunt
        writeAfter: (opts,next) ->
            docpad = @docpad

            rootPath = docpad.config.rootPath
            balUtil = require 'bal-util'

            command = ["#{rootPath}/node_modules/.bin/grunt", docpad.getEnvironment()]

            balUtil.spawn command, {cwd:rootPath,output:true}, ->
                # TODO: Cleanup?
                next()

            @
}

module.exports = docpadConfig
