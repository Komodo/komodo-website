jQuery ->
    jq = jQuery
    main = jq "section[role=main]"

    # Force Sidebar Min Height
    sidebar = jq "aside"
    if sidebar.length and sidebar.height() < main.height()
        sidebar.css "min-height", main.height()


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

    # Show Under Construction Warning - TODO: Remove for production
    showUcoModal = ->
        new Ink.UI.Modal( '#under-construction', {width: "400px", height: "250px", closeOnClick: true} );
    jq("#under-construction-tape").click showUcoModal
    if not jq.cookie "ucoWarning"
        showUcoModal()
        jq.cookie "ucoWarning", true

