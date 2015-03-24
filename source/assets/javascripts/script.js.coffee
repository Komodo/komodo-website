#= require "underscore/underscore"
#= require "jquery/jquery"
#= require "jquery-ui/ui/jquery-ui"
#= require "jReject/js/jquery.reject"
#= require "jquery-cookie/jquery.cookie"
#= require "textFit/textFit"
#= require "consolelog/consolelog"
#= require "modernizr/modernizr"
#= require "highlightjs/highlight.pack"
#= require "tooltipster/js/jquery.tooltipster"
#= require "magnific-popup/dist/jquery.magnific-popup"
#= require "github.commits.widget/js/github.commits.widget"
#= require "jquery-slideshow-lite/js/jquery.slideshow.lite"
#= require "handlebars/handlebars"
#= require "moment/moment"
#= require "jquery-visible/jquery.visible"
#= require "selectize/dist/js/standalone/selectize"
#= require "stickyfloat/stickyfloat.js"

#= require "helpers/localStorage"
#= require "helpers/handlebars"
#= require "twitter"

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
            #makeSplashResponsive
            loadSidebarCollapser
            loadDialogs
            loadTwitterFeed
            forceOpenExternal
            loadTags
            animateElements
            hideFooterOverlap
            disableLinks
            bindCheckboxEnablers
            bindPaneSelector
            loadFancySelector
            bindPageShare
            loadStickyFloat
            loadQuickNav
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
        jq('pre code').each (i, e) ->  hljs.highlightBlock e

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
        
        elem.click ->
            image = elem.css("background-image").replace(/url\((?:"|'|)/,'').replace(/(?:"|'|)\)/,'')
            jq.magnificPopup.open {
                items: src: image
                type: 'image'
            }

    # Load Testimonials
    loadTestimonials = ->
        return unless jq(".testimonial blockquote").length
    
        textFit(jq(".testimonial blockquote"), {minFontSize: 12, multiLine: true})
            
        if jq(".document-testimonials").length
            textFit(jq(".testimonial h2"), {multiLine: false})
            return
        
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
                    entry.name = '<a href="https://twitter.com/' + entry.name + '" target="_blank">' + entry.name + '</a>'

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

        if _gaq? || _gak? || clicky?
            jq("a[data-analytics]").click ->
                elem = jq this
                [category, action, label] = elem.data("analytics").split(":")
                _gak("send", "event", category, action, label) if _gak?
                _gaq.push(['_trackEvent', category, action, label]) if _gaq?
                
                clicky.log(window.location.href, [category, action, label].join(":"),
                           (if category is "download" then "download" else "outbound")) if clicky?

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

        jq('div.lightbox-group').each ->
            gallery = jq(this)
            gallery.magnificPopup
                delegate: 'a.lightbox-entry'
                type:'image'
                removalDelay: 500
                gallery:
                   enabled: true
                   navigateByImgClick: true
                   preload: [0,1]
                image:
                    titleSrc: (item) ->
                        if gallery.data("title")
                            return item.el.attr('title') + '<small>' + gallery.data("title") + '</small>'
                        else
                            return item.el.attr('title')

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
                branch: el.data("gh-branch") || "master"
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
        jq.ui.dialog.prototype._focusTabbable = -> {}

        jq("a[data-modal]").click (e) ->
            link = jq(this)
            elem = jq(link.data("modal-elem") || link.attr("href"))

            if ! elem.length
                return

            openModal(elem)
            e.preventDefault()
            return false

        if window.location.hash
            try
                elem = jq(window.location.hash)
                openModal(elem) unless elem.data("modal") == undefined
            catch e
                # Suppress

        # Open Modal Dialog
        openModal = (elem) ->
            if openModal._modal
                openModal._modal.dialog "close"

            elem.dialog(
                modal: true
                draggable: false
                closeOnEscape: true
                minWidth: jq(window).width() / 3
                maxHeight: jq(window).height() / 1.25
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
                close: ->
                    delete openModal._modal
            )

            openModal._modal = elem

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
    
        if jq(window).scrollTop() + jq(window).height() == jq(document).height()
            jq(".document-pricing .promotion").hide()
        else
            jq(".document-pricing .promotion").show()

    if jq('footer').length and jq(".document-pricing .promotion").length
        jq(window).scroll hideFooterOverlap

    disableLinks = ->
        jq("a.disabled").click ->
            elem = jq this
            return false if elem.hasClass "disabled"

    bindCheckboxEnablers = ->
        jq("input[type=checkbox][data-enables]").click ->
            elem = jq this

            if this.checked
                jq("#" + elem.data("enables")).removeClass("disabled")
            else
                jq("#" + elem.data("enables")).addClass("disabled")

    # Allow pane selection through select fields
    bindPaneSelector = ->
        jq("select.paneSelector").each ->
            elem = jq this
            prefix = elem.data("pane-prefix") || ""
            elem.change ->
                id = "#" + prefix + elem.val()
                jq(id).siblings().hide()
                jq(id).fadeIn("fast")
                window.location.hash = id

            hash = window.location.hash.substr(1).split("|")
            el = jq("#" + hash[0])

            if hash[0] and el.length and hash[0].indexOf(prefix) is 0
                el.siblings().hide()
                el.fadeIn("fast")
                window.location.hash = "#" + hash[1] if (hash[1])
                window.location.hash = "#" + hash.join("|")

                el = jq("[data-pane-prefix=\"#{prefix}\"]")
                if el.length and el[0].selectize
                    el[0].selectize.setValue(hash[0].substr(prefix.length))
                else
                    el.val(hash[0].substr(prefix.length)) if el.length

    # Load fancy selector, allowing for skinnable select fields with more functionality
    loadFancySelector = ->
        jq("select.selectize").each ->
            elem = jq this
            elem.selectize({
                onChange: (value) ->
                    setTimeout (->
                        elem.trigger "change"
                    ), 0
            });

    bindPageShare = ->
        jq(document).on('pageShared', onPageShare);

    onPageShare = (e) ->
        if _gak
            _gak.push(['_trackSocial', e.network, e.action]);
            
    loadStickyFloat = ->
        jq('.sticky').stickyfloat {
            offsetY: 100
            delay: 50
            easing: 'swing'
        }
        
    loadQuickNav = ->
        qn = jq(".quick-nav").length
        return unless qn
    
        w = jq window
    
        updateSelected = ->
            stop = w.scrollTop() + (w.height() / 2)
            
            jq(".quick-nav li").each ->
                el = jq this
                a = el.find("a")
                target =jq a.attr("href")
                start = target.offset().top
                end = start + target.height()
                
                if stop >= start and stop < end
                    unless el.is("[selected]")
                        jq(".quick-nav li[selected]").removeAttr("selected")
                        el.attr("selected", "true")
                    return false # stop iteration
        
        timer = null
        w.scroll ->
            clearTimeout timer
            timer = setTimeout updateSelected, 100
            
        jq(".quick-nav li a").click ->
            jq('html, body').animate {
                scrollTop: jq( jq(this).attr("href") ).offset().top
            }
            return false
        
        updateSelected()

    init()


