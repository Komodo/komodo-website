module.exports = {
    navigation: [
            name: "Home"
            link: "/"
        ,
            name: "Solutions"
            link: "#"
            icon: "sort-down"
            sub: [
                name: "Komodo Edit"
            ,
                name: "Pro Studio"
                link: "http://www.activestate.com/pro-studio"
            ]
        ,
            name: 'Resources'
            link: "{site.url}/resources"
            icon: "sort-down"
            sub: [
                name: "Screencasts"
            ,
                name: "Addons"
                link: "{site.url}/resources/addons"
            ,
                name: "Macros"
                link: "{site.url}/resources/macros"
            ,
                name: "Toolbox"
                link: "{site.url}/resources/toolbox"
            ,
                name: "Color Schemes"
                link: "{site.url}/resources/colorschemes"
            ,
                name: "Skins"
                link: "{site.url}/resources/skins"
            ,
                name: "Iconsets"
                link: "{site.url}/resources/iconsets"
            ,
                name: "Languages"
                link: "{site.url}/resources/languages"
            ,
                name: "Keybindings"
                link: "{site.url}/resources/keybindings"
            ,
                name: "Miscellaneous"
                link: "{site.url}/resources/miscellaneous"
            ]
        ,
            name: "Blog"
        ,
            name: "Forums"
            link: "http://forum.komodoide.com/"
        ,
            name: "Try"
            link: "{site.url}/download"
        ,
            name: "Buy & Upgrade"
            link: "{site.url}/pricing"
    ]
}
