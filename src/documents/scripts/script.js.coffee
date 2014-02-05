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

    # Show Under Construction Warning - TODO: Remove for production
    showUcoModal = ->
        jq('#under-construction').dialog(
            modal: true
            draggable: false
            closeOnEscape: true
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
                    jq('#under-construction').dialog "close"
        )

    jq("#under-construction-tape").click showUcoModal
    
    if not jq.cookie "ucoWarning"
        showUcoModal()
        jq.cookie "ucoWarning", true

    # Analytics
    if _gaq?
        jq("a[href]").click ->
            a = jq this
            href = a.attr("href")
            href = href.substr(href.indexOf("#")+1) if href.indexOf("framed.html#") != -1
            if href.indexOf("activestate.com") != -1
                _gaq.push(['_link', href])

    # Tooltips
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

    jq('a.lightbox').magnificPopup
        type:'image'
        removalDelay: 500

    # Github commits widget
    jq(".github-commits").each ->
        el = jq this
        el.githubInfoWidget
            user: el.data("gh-user") || "Komodo"
            repo: el.data("gh-repo") || "KomodoEdit"
            branch: el.data("gh-branch") || "trunk"
            last: el.data("gh-amount") || 5
            avatarSize: el.data("gh-avatarSize") || 16
