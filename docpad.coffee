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
    ignoreCustomPatterns: /public\/vendor|public\/images|src\/databases|\/_/

    # Default Env
    env: process.env.DOCPAD_ENV or "development"

    templateData:

        _: _

        db:
            header: -> @requireDb('header')
            footer: -> @requireDb('footer')
            addons: -> @requireDb('addons')
            testimonials: -> @requireDb('testimonials')
            placeholders: -> @requireDb('placeholders')
            features: -> @requireDb('features')
            startpage: -> @requireDb('startpage')

            cache: {}
            requireDb: (name) ->
                return @cache[name] if @cache[name]
                requireFresh(__dirname + '/src/databases/' + name + '.coffee')

        site:
            url: "http://192.168.0.100:9778"
            title: "Komodo IDE"
            description: """
One IDE, All Your Favourite Languages. Komodo is the professional IDE for major web languages, including Python, PHP, Ruby, Perl, HTML, CSS and JavaScript.
                """
            socialDescription: """
Check out @KomodoIDE! One IDE for all major web languages.
                """ # Max length: 117
            keywords: """
komodo,komodo ide,activestate komodo ide,activestate komodo ide 6,activestate komodo,activestate ide,comodo ide,activestate comodo,kumodo ide,active state komodo,perl komodo ide,ide software,perl ide,python ide,ide python,tcl ide,integrated development environment,development environment,activetstate,komodo linux,komodo mac
                """

        getPreparedTitle: ->
            if @document.title then "#{@document.title} | #{@site.title}" else @site.title

        getPreparedDescription: ->
            @document.description or @site.description

        getPreparedSocialDescription: ->
            if @document.socialDescription
                return @document.socialDescription

            if @document.layout is 'blog'
                return @document.title + ' via @KomodoIDE'

            return @site.socialDescription

        getPreparedKeywords: ->
            @site.keywords.concat(@document.keywords or []).join(', ')

        getGruntedStyles: ->
            styles = []
            gruntConfig = require('./grunt-config.json')

            if docpad.getEnvironment() == "development"
                styles = _.flatten gruntConfig.cssmin.combine.files
            else
                minify = gruntConfig.cssmin.minify
                _.each minify.src, (value) ->
                    styles.push minify.cwd + value.replace(/.css$/, minify.ext)

            site = docpad.config.templateData.site
            _.map styles, (value) ->
                site.url + '/' + value.replace 'out/', ''

        getGruntedScripts: ->
            scripts = []
            gruntConfig = require('./grunt-config.json')

            if docpad.getEnvironment() == "development"
                scripts = _.flatten gruntConfig.uglify.scripts.files
            else
                scripts = _.keys gruntConfig.uglify.scripts.files

            site = docpad.config.templateData.site
            _.map scripts, (value) ->
                site.url + '/' + value.replace 'out/', ''

        getAsList: (ob, classAttr = "") ->
            site = docpad.config.templateData.site
            latestConfig = docpad.getConfig()
            imgPath = @site.url + "/images/"

            r = ['<ul class="' + (classAttr) + '">']
            _.each ob, (value, key) ->

                value.link = site.url if value.link is '/'

                r.push '<li><a href="' + (value.link || site.url + "/" + value.name.toLowerCase()) +
                            '" title="' + value.name +
                            '" target="' + (value.target || "_self") + '">'
                r.push '<img src="' + imgPath + value.img + '" alt="' + value.name + '"/>' unless ! value.img
                r.push '<span class="link-name">' + value.name + '</span>'
                r.push latestConfig.templateData.getAsList(value.sub) unless ! value.sub
                r.push '</a></li>'

            r.push "</ul>"
            r.join("")

        getBlogsFiltered: (filters = {}, add = false, document = false) ->
            if add
                filters = _.extend filters, add

            filters.isPagedAuto = $ne: true
            filters.dontList = $ne: true

            entries = docpad.getCollection('blog').findAllLive(filters).toJSON()

            if document and document.page
                return entries[document.page.startIdx...document.page.endIdx]
            else
                return entries

        getDuration: (seconds) ->
            min = Math.floor(seconds / 60)
            sec = seconds - (min * 60)
            if sec < 10
                sec = "0" + sec
            return min + ":" + sec

    environments:
        development:
            ignoreCustomPatterns: /public\/vendor|public\/images|blog\/2010|blog\/2011|blog\/2012|blog\/2013-0/
            templateData:
                vimeoFeeds:
                    requireFresh(__dirname + '/src/databases/placeholders.coffee').vimeoFeeds
            plugins:
                vimeofeed:
                    dontParse: true
                partials:
                    referenceOthers: false
            enabledPlugins:
                paged: false

        qa:
            templateData:
                site:
                    url: 'http://qa.komodoide.com'
            plugins:
                scheduling:
                    defaultScheduling: false
        static:
            templateData:
                site:
                    url: 'http://komodoide.com'

    collections:
        splash: ->
            @getCollection('documents').findAllLive({relativeOutDirPath:'splash'}, [basename: 1])
        blog: ->
            @getCollection('documents').findAllLive({relativeOutDirPath:/blog[\/\\]\w+/}, [date: -1])

    plugins:
        ghpages:
            deployRemote: 'origin'
            deployBranch: 'gh-pages'

        vimeofeed:
            user: "komodoide"
            templateAlbum: "album.html.ect"
            templateVideo: "video.html.ect"
            outPath: "screencasts"
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
            robotskirtOptions:
                EXT_AUTOLINK: true
                EXT_FENCED_CODE: true
                EXT_LAX_SPACING: true
                EXT_NO_INTRA_EMPHASIS: true
                EXT_SPACE_HEADERS: true
                EXT_STRIKETHROUGH: true
                EXT_SUPERSCRIPT: true
                EXT_TABLES: true
                HTML_SKIP_HTML: false
                HTML_SKIP_STYLE: false
                HTML_SKIP_IMAGES: false
                HTML_SKIP_LINKS: false
                HTML_EXPAND_TABS: false
                HTML_SAFELINK: false
                HTML_TOC: false
                HTML_HARD_WRAP: false
                HTML_USE_XHTML: true
                HTML_ESCAPE: false

        partials:
            partialsPath: 'templates'
        paged:
            cleanurl: true
            startingPageNumber: 2

        sitemap:
            changefreq: 'weekly'
            priority: 0.5
            hostname: 'http://komodoide.com'
        scheduling:
            defaultScheduling: true
            devScheduling: false
        consolidate:
            ect: true

    enabledPlugins:
        youtubefeed: false

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

        serverExtend: (opts) ->
            {server} = opts
            docpad = @docpad

            require(__dirname + '/routes.coffee')({docpad, server})

        #render: (opts) ->
        #
        #    {file} = opts
        #
        #    if file.attributes.fullDirPath.indexOf("templates") == -1
        #        @docpad.log "info", "Rendering: " + file.attributes.relativePath
}

module.exports = docpadConfig
