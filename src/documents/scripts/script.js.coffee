jQuery ->
    jq = jQuery
    main = jq "section[role=main]"

    # Reject Older Browsers
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
    jq('pre code.hljs').each (i, e) ->  hljs.highlightBlock e

    # Splash Screenshots
    ss = jq("#splash-screenshots")
    if ss.length
        platform = window.navigator.platform.toLowerCase()

        if platform.indexOf "linux" != -1
            platform = "linux"
        else if platform.indexOf "win" != -1
            platform = "windows"
        else if platform.indexOf "mac" != -1
            platform = "osx"

        elem = ss.find(".splash-" + platform)
        oldPrimary = ss.find(".primary")

        if elem and elem != oldPrimary
            if elem.hasClass("secondary")
                elemClass = "secondary"
            else
                elemClass = "tertiary"

            elem.removeClass elemClass
            elem.addClass "primary"
            oldPrimary.removeClass "primary"
            oldPrimary.addClass elemClass

    # Load Testimonials
    if jq(".testimonial blockquote").length
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
    if _gaq?
        jq("a[href]").click ->
            a = jq this
            href = a.attr("href")
            href = href.substr(href.indexOf("#")+1) if href.indexOf("framed#") != -1
            if href.indexOf("activestate.com") != -1
                _gaq.push(['_link', href])

    # Tooltips
    bindTooltips = ->
        jq('.tooltip').tooltipster
            contentAsHTML: true
            position: 'right'
            maxWidth: 250
            functionReady: (origin, tooltip) ->
                arrow = tooltip.find(".tooltipster-arrow")
                if arrow.hasClass "tooltipster-arrow-right"
                    arrow.find("span").css "left", "-8px"
                if arrow.hasClass "tooltipster-arrow-left"
                    arrow.find("span").css "right", "-8px"
    bindTooltips()

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
    jq(".github-commits").each ->
        el = jq this
        el.githubInfoWidget
            user: el.data("gh-user") || "Komodo"
            repo: el.data("gh-repo") || "KomodoEdit"
            branch: el.data("gh-branch") || "trunk"
            last: el.data("gh-amount") || 5
            avatarSize: el.data("gh-avatarSize") || 16

    # Tabs
    jq(".tabs").tabs()

    # Download buttons
    if jq(".document-download").length
        platform = window.navigator.platform.toLowerCase()

        if platform.indexOf "linux" != -1 and platform.indexOf "86_64" != -1
            platform = "linux-64"
        else if platform.indexOf "linux" != -1 or platform.indexOf "x11" != -1
            platform = "linux"
        else if platform.indexOf "win" != -1
            platform = "windows"
        else if platform.indexOf "mac" != -1
            platform = "mac"

        jq(".dl-button.dl-" + platform + ":not(.primary)").each ->
            el = jq this
            oldPrimary = el.closest("div").find(".dl-button.primary")
            oldPrimary.removeClass "big"
            oldPrimary.removeClass "primary"
            el.addClass "big primary"
            el.parent().insertBefore(oldPrimary)

    # Nav Collapse
    jq("header .collapser").click -> jq("header nav").toggleClass "expanded"

    # Responsive Scripts - TODO: Replace with pure CSS solution

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
    #jq("aside").toggleClass "expand"

    # JS Dialogs
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
                jq('.ui-widget-overlay').click ->
                    elem.dialog "close"
        )

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

    # Twitter Feed
    twitterTemplate = jq("#tweet-template")
    if twitterTemplate.length
        new TwitterFeed().renderWidget twitterTemplate, 4, -> bindTooltips()

