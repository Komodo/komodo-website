# Export Plugin
module.exports = (BasePlugin) ->

    _ = require "underscore"

    # Define Plugin
    class youtubefeed extends BasePlugin
        # Plugin name
        name: 'youtubefeed'

        # Cache
        opts: null
        templateDoc: null

        generateBefore: (opts,next) ->
            @opts = opts
            {templateData} = @opts

            templateData.youtubeFeeds = {} unless templateData.youtubeFeeds
            @config.dontParse = [] unless @config.dontParse

            if @config.feeds
                @iterator @parseFeed, @config.feeds, next
            else
                next()

            return @

        renderBeforePriority: 550
        renderBefore: (opts,next) ->
            @opts = opts

            if @config.feeds
                @iterator @generateDocs, @config.feeds, next
            else
                next()

            return @

        iterator: (fn, arr, next) ->
            self = @
            docpad = @docpad
            _next = (index = 0) ->
                if index == arr.length
                    return next()
                try
                    fn.call self, arr[index], _next.bind(self, ++index)
                catch e
                    docpad.log "error", e.message
                    next()
            _next()

        parseFeed: (feed, next) ->
            self = @
            docpad = @docpad
            {templateData} = @opts

            unless _.indexOf(@config.dontParse, feed.name) is -1
                return next()

            # Generate Youtube Feed Data
            feedParser = require 'fast-feed'
            request = require 'request'

            request(feed.url, (error, response, body) ->
                items = feedParser.parse(body).items
                _.each items, (item) -> item.id = item.link.match(/watch\?v=([a-z0-9]*?)\&/i)[1]
                templateData.youtubeFeeds[feed.name] = items
                next()
            )

        generateDocs: (feed, next) ->
            {templateData} = @opts

            return next() unless feed.outFilename && templateData.youtubeFeeds[feed.name]

            @templateDoc = @docpad.getCollection('documents').findOne(
                filename: feed.outFilename
                relativeOutDirPath: feed.outPath || "/"
            )

            feedItems = templateData.youtubeFeeds[feed.name]
            @iterator @generateDoc, feedItems, next

        generateDoc: (item, next) ->
            {collection,templateData} = @opts
            database = @docpad.getDatabase()

            doc = @docpad.cloneModel @templateDoc

            filename = item.id + ".html"
            fs = require 'fs' # TODO: Properly implement this
            return next() if fs.existsSync doc.get("outDirPath") + "/" + filename

            attr =
                basenameOrig: doc.get "basename"
                title: item.title
                outFilename: filename
                outPath: doc.get("outDirPath") + "/" + filename
                fullPath: null # treat it as a virtual document
                relativePath: doc.get("relativeDirPath") + "/" + filename
                filename: filename
                outFilename: filename

            doc.set attr
            doc.set "feedItem", item
            doc.setMeta attr

            doc.normalize (err) ->
                unless err
                    # Add it to the database
                    collection.add(doc)
                    database.add(doc)
                next()
