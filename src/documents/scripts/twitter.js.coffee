class TwitterFeed

    jq = jQuery
    url = "https://script.google.com/macros/s/AKfycbyWQU77RVvMKLQt2PWLrt4tJO_fSoPYcLMtGoiS1HGizqazzvU/exec"

    getWidgetData: (callback) ->
        self = @
        timestamp = new Date().getTime()

        if window.localStorage?
            cacheTimestamp = window.localStorage.getItem("twitterFeedCacheAge")
            cache = window.localStorage.getItem("twitterFeedCache")

            if cache and cacheTimestamp and (cacheTimestamp - timestamp) < 300
                return @processWidgetData(cache, callback)

        jq.ajax(url: url, dataType: "text").done (responseText) ->
            window.localStorage.setItem("twitterFeedCache", responseText)
            window.localStorage.setItem("twitterFeedCacheAge", timestamp)
            self.processWidgetData(responseText, callback)

    processWidgetData: (responseText, callback) ->
        self = @
        data = []
        jq(responseText).find("ol.h-feed > li").each ->
            entry = jq this
            entryFormatted =
                author: entry.find(".p-author .full-name .p-name").text()
                author_link: entry.find(".p-author .u-url.profile").attr("href")
                nick: entry.find(".p-author .p-nickname").text()
                avatar: entry.find(".p-author .u-photo.avatar").attr("src")
                tweet: self.sanitize(entry.find(".e-entry-content .e-entry-title").html())
                link: entry.find(".header a.u-url.permalink").attr("href")
                media: false
                retweet: false
                retweet_count: entry.find(".stats-narrow .stats-retweets strong").text()
                favorite_count: entry.find(".stats-narrow .stats-favorites strong").text()
                reply_link: entry.find(".tweet-actions .reply-action").attr("href")
                retweet_link: entry.find(".tweet-actions .retweet-action").attr("href")
                favorite_link: entry.find(".tweet-actions .favorite-action").attr("href")

            media = entry.find(".e-entry-content .inline-media")
            entryFormatted.media = self.sanitize(media.html()) if media.length

            retweet = entry.find(".e-entry-content .retweet-credit")
            if retweet.length
                profile = retweet.find(".profile")
                entryFormatted.retweet =
                    author: profile.text()
                    nick: profile.attr("href").split('/').slice(-1)[0]
                    link: profile.attr("href")

            data.push entryFormatted

        callback(data)

    renderWidget: (templateSrc, max = 10, callback = null) ->
        template = Handlebars.compile(templateSrc.html());
        @getWidgetData (tweets) ->
            n = 0
            while n < max and n < tweets.length
                templateSrc.parent().append(template(tweets[n]))
                n++

            callback() if callback

    sanitize: (html) ->
        self = @
        elem = jq "<div>" + html + "</div>"
        elem.find("*").filter(->
            attrs = this.attributes
            i = 0
            while i < attrs.length
                return true if attrs[i].nodeName.indexOf('data-') == 0
                i++
            return false
        ).each -> self.removeDataFromElem(jq(this))
        elem.find("a").each ->
            jq(this).attr "target", "_blank"
        elem.html()

    removeDataFromElem: (elem) ->
        keys = jq.map(elem.data(), (value, key) -> key)

        for key in keys
            elem.removeAttr "data-" + key.replace(/([A-Z])/g, "-$1").toLowerCase()

window.TwitterFeed = TwitterFeed
