# Export Plugin
module.exports = (BasePlugin) ->

    _ = require "underscore"

    # Define Plugin
    class vimeofeed extends BasePlugin
        # Plugin name
        name: 'vimeofeed'

        # Cache
        opts: null
        templateDoc: null
        videosImported: {}

        generateBefore: (opts,next) ->
            @opts = opts
            {templateData} = @opts
            self = @

            templateData.vimeoFeeds = {} unless templateData.vimeoFeeds

            if @config.user
                @parseAlbums ->
                    templateData.vimeoFeeds.videos.sort self.sortById
                    next()
            else
                next()

            return @

        renderBeforePriority: 550
        renderBefore: (opts,next) ->
            @opts = opts

            if @config.outPath
                @generateDocs next
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

        parseAlbums: (next) ->
            self = @
            {templateData} = @opts

            return next() if @config.dontParse

            url = 'http://vimeo.com/api/v2/' + @config.user + '/albums.json'
            templateData.vimeoFeeds = {} unless templateData.vimeoFeeds?
            templateData.vimeoFeeds.albums = [] unless templateData.vimeoFeeds.albums
            templateData.vimeoFeeds.videos = [] unless templateData.vimeoFeeds.videos

            # Generate Vimeo Feed Data
            @request = require 'request'

            @request(url, (error, response, body) ->
                albums = JSON.parse(body)
                albums.sort self.sortByTitle
                done = 0
                _.each albums, (album) ->
                    album.title_sane = self.makeSane album.title
                    album.videos = []
                    templateData.vimeoFeeds.albums.push album

                self.iterator self.parseVideos, albums, next
            )

        parseVideos: (album, next) ->
            self = @
            {templateData} = @opts

            url = 'http://vimeo.com/api/v2/album/' + album.id + '/videos.json'

            @request(url, (error, response, body) ->
                videos = JSON.parse(body)
                _.each videos, (video) ->
                    video.title_sane = self.makeSane video.title
                    album.videos.push video

                    unless self.videosImported[video.id]?
                        templateData.vimeoFeeds.videos.push video
                        self.videosImported[video.id] = true

                next()
            )

        # TODO: Properly use collections so that DocPad handles this stuff
        sortByTitle: (a,b) ->
            return 0 if a.title == b.title
            return -1 if a.title < b.title
            return 1 if a.title > b.title

        sortById: (a,b) ->
            aid = parseInt(a.id)
            bid = parseInt(b.id)
            return -1 if aid > bid
            return 1 if aid < bid

        makeSane: (str) ->
            str.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '')

        generateDocs: (next) ->
            self = @
            {templateData} = @opts

            return next() unless templateData.vimeoFeeds

            @templateAlbum = @docpad.getCollection('documents').findOne(
                filename: @config.templateAlbum
                relativeOutDirPath: @config.outPath
            )
            
            @templateVideo = @docpad.getCollection('documents').findOne(
                filename: @config.templateVideo
                relativeOutDirPath: @config.outPath
            )

            @iterator @generateDoc, templateData.vimeoFeeds.albums, ->
                self.iterator self.generateDoc, templateData.vimeoFeeds.videos, next

        generateDoc: (item, next) ->
            {collection,templateData} = @opts
            database = @docpad.getDatabase()

            return next() if item.tracked
            item.tracked = true

            if item.total_videos #Album
                doc = @docpad.cloneModel @templateAlbum
                outSuffix = 'category'
                filename = item.title_sane + ".html"
            else # Video
                doc = @docpad.cloneModel @templateVideo
                outSuffix = 'watch'
                filename = item.id + "-" + item.title_sane + ".html"

            outPath = doc.get("outDirPath") + "/" + outSuffix + "/" + filename

            attr =
                basenameOrig: doc.get "basename"
                title: item.title
                outFilename: filename
                outPath: outPath
                fullPath: null # treat it as a virtual document
                relativePath: doc.get("relativeDirPath") + "/" + outSuffix + "/" + filename
                filename: filename
                outFilename: filename
                date: item.upload_date? || item.created_on

            doc.set attr
            doc.set "feedItem", item
            doc.setMeta attr

            doc.normalize (err) ->
                unless err
                    # Add it to the database
                    collection.add(doc)
                    database.add(doc)
                next()
