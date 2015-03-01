jQuery ->
    return
    jq = jQuery
    splash = jq("#splash-screenshots")
    primary = splash.find(".primary")
    onTop = primary.clone()
    onTop.addClass "on-top"
    primary.after onTop
    
    splash.find("figure").mouseover ->
        elem = jq this
        elem.stop(true, true)
        if elem.hasClass("primary")
            return
        onTop.animate({opacity: 0}, 200)
        #onTop.fadeOut 200
        
    splash.find("figure").mouseout ->
        elem = jq this
        if elem.hasClass("primary")
            return
        onTop.animate({opacity: 1}, 200)
        #onTop.fadeIn 200



