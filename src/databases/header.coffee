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
            name: "Pricing"
        ,
            name: "Download"
        ,
            name: 'Resources'
            link: "{site.url}/resources"
            icon: "sort-down"
            sub: [
                name: "Screencasts"
            ,
                name: "Addons"
                link: "/resources/addons"
            ,
                name: "Macros"
                link: "/resources/macros"
            ,
                name: "Toolbox"
                link: "/resources/toolbox"
            ,
                name: "Color Schemes"
                link: "/resources/colorschemes"
            ,
                name: "Skins"
                link: "/resources/skins"
            ,
                name: "Iconsets"
                link: "/resources/iconsets"
            ,
                name: "Languages"
                link: "/resources/languages"
            ,
                name: "Keybindings"
                link: "/resources/keybindings"
            ,
                name: "Miscellaneous"
                link: "/resources/miscellaneous"
            ]
        ,
            name: "Blog"
        ,
            name: "Forums"
            link: "http://forum.komodoide.com/"
    ]
}
