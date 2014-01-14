jQuery ->
    jq = jQuery
    main = jq("section[role=main]")

    sidebar = jq("aside")
    if sidebar.length and sidebar.height() < main.height()
        sidebar.css("min-height", main.height())


