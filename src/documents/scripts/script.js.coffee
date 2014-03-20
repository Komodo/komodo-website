jQuery ->

    jq = jQuery
    main = jq "section[role=main]"

    init = () ->
        fns = [
            rejectOldBrowsers
            highlightCode
            loadSplashScreenshots
            loadTestimonials
            bindAnalytics
            bindTooltips
            bindLightbox
            loadGithubCommits
            loadTabs
            loadDownloadButtons
            loadNavmenu
            makeSplashResponsive
            loadSidebarCollapser
            loadDialogs
            loadTwitterFeed
            forceOpenExternal
            loadTags
            animateElements
            hideFooterOverlap
        ]
        for fn in fns
            setTimeout fn, 0

    # ----- Misc Scripts -----

    # Reject Older Browsers
    rejectOldBrowsers = ->
        reject = ["msie5", "msie6", "msie7", "msie8", "firefox1", "firefox2",
                  "firefox3", "konqueror", "safari2", "safari3"]
        reject = _.reduce reject, (o, v) ->
            o[v] = true
            return o
        , {}

        jq.reject
            reject: reject
            display: _.shuffle ['chrome', 'firefox', 'safari', 'msie']
            imagePath: "/images/browsers/"
            browserInfo: # Fix Naming Inconsistencies
                msie:
                    text: 'Internet Explorer'
                safari:
                    text: 'Safari'

    # Highlight Code
    highlightCode = ->
        jq('pre code.hljs').each (i, e) ->  hljs.highlightBlock e

    # Splash Screenshots
    loadSplashScreenshots = ->
        ss = jq("#splash-screenshots")
        return unless ss.length

        platform = window.navigator.platform.toLowerCase()
        if platform.indexOf("linux") != -1
            platform = "linux"
        else if platform.indexOf("win") != -1
            platform = "windows"
        else if platform.indexOf("mac") != -1
            platform = "osx"

        elem = ss.find(".splash-" + platform)
        oldPrimary = ss.find(".primary")

        if elem and !elem.hasClass("primary")
            if elem.hasClass("secondary")
                elemClass = "secondary"
            else
                elemClass = "tertiary"

            elem.removeClass elemClass
            elem.addClass "primary"
            oldPrimary.removeClass "primary"
            oldPrimary.addClass elemClass

        ss.find(".promotion").appendTo ss.find(".primary")
        ss.find(".twitter-follow-button").appendTo ss.find(".primary")

    # Load Testimonials
    loadTestimonials = ->
        return unless jq(".testimonial blockquote").length
    
        textFit(jq(".testimonial blockquote"))
        jq.getJSON("/json/testimonials.json").done (data) ->
            pos = 0
            data = _.shuffle data
            template = jq("#splash-news-testimonials .testimonial").clone()
            setInterval (->
                pos = 0 if pos == data.length

                entry = _.clone data[pos]
                currentEntry = jq("#splash-news-testimonials .testimonial")
                newEntry = template.clone()

                if entry.source_name
                    if entry.source
                        entry.source = '<a href="' + entry.source + '" target="_blank">' + entry.source_name + '</a>'
                    else
                        entry.source = entry.source_name

                if entry.source_name == "Twitter"
                    entry.name = '<a href="https://twitter.com/activestate' + entry.name + '" target="_blank">' + entry.name + '</a>'

                newEntry.find("*[data-field]").each ->
                    elem = jq(this)
                    elem.show()
                    elem.hide() unless entry[elem.data("field")]
                    elem.html(entry[elem.data("field")])

                newEntry.hide().appendTo(currentEntry.parent())
                currentEntry.fadeOut ->
                    newEntry.fadeIn()
                    textFit(newEntry.find("blockquote"), {alignVert: true})
                    currentEntry.remove()
                    currentEntry = newEntry

                pos++
            ), 10000
    
    # Analytics
    bindAnalytics = ->
        if _gaq?
            jq("a[href]").click ->
                a = jq this
                href = a.attr("href")
                href = href.substr(href.indexOf("framed/?")+8) if href.indexOf("framed/?") != -1
                if href.indexOf("activestate.com") != -1
                    _gaq.push(['_link', href])

        if _gak?

            href = window.location.href
            if href.indexOf("framed/?") != -1
                href = href.substr(href.indexOf("?")+1)
                prefix = window.location.pathname
                prefix += "/" if prefix.substr(-1) != "/"
                path = prefix + href.replace(/^https?:\/\//, '')

            if path?
                _gak('send', 'pageview', path)
            else
                _gak('send', 'pageview')

        if _gaq? || _gak?
            jq("a[data-analytics]").click ->
                elem = jq this
                [category, action, label] = elem.data("analytics").split(":")
                _gak("send", "event", category, action, label) if _gak?
                _gaq("send", "event", category, action, label) if _gaq?

    # Tooltips
    bindTooltips = ->
        jq('.tooltip').each ->
            elem = jq(this)
            elem.tooltipster
                contentAsHTML: true
                position: elem.data("tooltip-position") || 'right'
                theme: "tooltipster-default " + (elem.data("tooltip-class") || '')
                maxWidth: 250
                functionReady: (origin, tooltip) ->
                    arrow = tooltip.find(".tooltipster-arrow")
                    if arrow.hasClass "tooltipster-arrow-right"
                        arrow.find("span").css "left", "-8px"
                    if arrow.hasClass "tooltipster-arrow-left"
                        arrow.find("span").css "right", "-8px"

    # Lightbox
    bindLightbox = ->
        jq('a.lightbox').magnificPopup
            type:'image'
            removalDelay: 500

        jq('div.lightbox').magnificPopup
            delegate: 'a'
            type:'image'
            removalDelay: 500
            gallery:
               enabled: true
               navigateByImgClick: true
               preload: [0,1]

        jq('.slideshow').each ->
            elem = jq this
            elem.slideshow
                caption: elem.data("caption") == "true"
                width: elem.data("width")
                height: elem.data("height")
                pauseSeconds: elem.data("pause") || 6

    # Github commits widget
    loadGithubCommits = ->
        jq(".github-commits").each ->
            el = jq this
            el.githubInfoWidget
                user: el.data("gh-user") || "Komodo"
                repo: el.data("gh-repo") || "KomodoEdit"
                branch: el.data("gh-branch") || "trunk"
                last: el.data("gh-amount") || 5
                avatarSize: el.data("gh-avatarSize") || 16

    # Tabs
    loadTabs = ->
        jq(".tabs").tabs()

    # Download buttons
    loadDownloadButtons = ->
        return unless jq(".document-download").length
        platform = window.navigator.platform.toLowerCase()

        if platform.indexOf("linux") != -1 and platform.indexOf("86_64") != -1
            platform = "linux-64"
        else if platform.indexOf("linux") != -1 or platform.indexOf("x11") != -1
            platform = "linux"
        else if platform.indexOf("win") != -1
            platform = "windows"
        else if platform.indexOf("mac") != -1
            platform = "mac"

        jq(".dl-button.dl-" + platform + ":not(.primary)").each ->
            el = jq this
            oldPrimary = el.closest("div").find(".dl-button.primary")
            oldPrimary.removeClass "big"
            oldPrimary.removeClass "primary"
            el.addClass "big primary"
            el.parent().insertBefore(oldPrimary)

    # Nav Collapse
    loadNavmenu = ->
        jq("header .collapser").click -> jq("header nav").toggleClass "expanded"

    # Responsive Scripts - TODO: Replace with pure CSS solution
    makeSplashResponsive = ->
        ss = jq("#splash-screenshots")
        ssf = jq("#splash-screenshots figure.primary")

        splashResizeHandler = ->
            if (jq(document).width() < 1100)
                ratio = jq(document).width()/1150
                ss.css('transform','scale('+(ratio)+')')
                ss.height(ssf[0].getBoundingClientRect().height + 25)

            if (jq(document).width() > 1100)
                jq("#splash-screenshots").css('transform','')
                jq("#splash-screenshots").height("")

        if ss.length
            jq(window).resize splashResizeHandler
            splashResizeHandler()

    # Sidebar collapser
    loadSidebarCollapser = ->
        sideCollapse = jq("#side-collapse")
        sideInner = jq("aside .inner")
        sideCollapse.click ->
            sideCollapse.fadeOut("fast", ->
                sideInner.toggle("slide", {direction: 'right'}, ->
                    sideCollapse.fadeIn "fast"
                    sideInner.css("display", "")
                )
                jq("aside").toggleClass("expand")
            )

    # JS Dialogs
    loadDialogs = ->
        jq("a[data-modal]").click ->
            elem = jq(jq(this).attr("href"))
            openModal(elem)
            return false

        if window.location.hash
            try
                elem = jq(window.location.hash)
                openModal(elem) unless elem.data("modal") == undefined
            catch e
                # Suppress

        # Open Modal Dialog
        openModal = (elem) ->
            elem.dialog(
                modal: true
                draggable: false
                closeOnEscape: true
                minWidth: jq(window).width() / 3
                maxHeight: jq(window).height() / 1.5
                show:
                    effect: "fade"
                    duration:500
                    easing:"easeOutExpo"
                hide:
                    effect: "drop"
                    direction: "down"
                    distance:100
                    duration:500
                    easing:"easeOutExpo"
                open: ->
                    elem.find("[data-enable-after]").each ->
                        el = jq this
                        el.attr "disabled", true
                        setTimeout(
                            -> el.removeAttr "disabled",
                            parseInt(el.data("enable-after")) * 1000
                        )

                    jq('.ui-widget-overlay').click ->
                        elem.dialog "close"
            )

    # Twitter Feed
    loadTwitterFeed = ->
        twitterTemplate = jq("#tweet-template")
        if twitterTemplate.length
            new TwitterFeed().renderWidget twitterTemplate, 4, -> bindTooltips()

    # Open external links in a new window
    forceOpenExternal = ->
        href = new RegExp('^' + window.location.protocol + '\\/\\/(?:[a-z]*?\.|)' + window.location.hostname)
        jq("a[href^='http']").filter( ->
            return ! jq(this).attr("href").match(href)
        ).attr("target", "_blank")

    # Tagged Blogs
    loadTags = ->
        return unless jq("#content").hasClass "document-tagged"

        tag = decodeURI(window.location.search.substr(1))
        tagTemplate = Handlebars.compile( jq("#tag-template").html() )

        jq.getJSON("/json/tags.json").done (tags) ->
            if tags[tag]
                html = tagTemplate({tags: tags, tag: tag, documents: tags[tag].documents})
                jq(html).appendTo(jq("#content article"))
                jq("#content article .loading").remove()

    # Animate Elements
    animateElements = ->
        jq(".animateOnLoad").each ->
            elem = jq this
            elem.addClass("animate")
            setTimeout ->
                elem.removeClass("animate")
                elem.addClass("animate-over")
            , elem.data("animation-duration") || 400

    # Hide footer overlap
    hideFooterOverlap = ->
        return unless jq('footer').length
        if jq('footer').visible(true) and jq(".document-pricing .promotion").is(":visible") and jq(window).scrollTop()
            jq(".document-pricing .promotion").hide()

        if ! jq('footer').visible(true) and ! jq(".document-pricing .promotion").is(":visible")
            jq(".document-pricing .promotion").show()

    if jq('footer').length and jq(".document-pricing .promotion").length
        jq(window).scroll hideFooterOverlap

    init()


