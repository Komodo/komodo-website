module.exports = {
    navigation: [
            name: "Home",
            link: "/"
        ,
            name: "Flavours",
            link: "#"
            sub: [
                name: "Komodo Edit" 
            ,
                name: "Pro Studio"
                link: "/framed/?http://www.activestate.com/pro-studio"
            ]
        ,
            name: "Pricing"
        ,
            name: "Download"
        ,
            name: 'Resources'
            name_append: '<span class="badge">BETA</span>'
            link: "{site.url}/resources"
        ,
            name: "Blog"
        ,
            name: "Screencasts"
        ,
            name: "Forums"
            link: "http://forum.komodoide.com/"
    ]
}
