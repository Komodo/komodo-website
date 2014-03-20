module.exports = {
    nav:

        navigation: [
            name: "Home"
            link: "/"
        ,
            name: "Features"
        ,
            name: "Pricing"
        ,
            name: "Download"
            sub: [
                name: "Archive"
                link: "/framed/?http://downloads.activestate.com/Komodo/"
            ]
        ,
            name: "Customize"
            sub: [
                name: "Discover"
                link: "/framed/?http://community.activestate.com/addons"
            ,
                name: "Get Involved"
                link: "/customize#contributing"
            ]
        ,
            name: "Support"
            link: "http://forum.komodoide.com/category/support"
            sub: [
                name: "Documentation"
                link: "/framed/?http://docs.activestate.com/komodo"
            ,
                name: "Report Bug"
                link: "http://bugs.activestate.com/enter_bug.cgi?product=Komodo"
                target: "_blank"
            ]
        ]

        support: [
            name: "Documentation"
            link: "/framed/?http://docs.activestate.com/komodo"
        ,
            name: "API Reference"
            link: "/framed/?http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_top"
        ,
            name: "&nbsp;"
            link: "#"
        ,
            name: "Report a Bug"
            link: "http://bugs.activestate.com/enter_bug.cgi?product=Komodo"
            target: "_blank"
        ,
            name: "Ask the Community"
            link: "http://forum.komodoide.com/"
        ]

        activestate: [
            name: "About"
            link: "http://www.activestate.com/company"
            target: "_blank"
        ,
            name: "Contact"
            link: "http://www.activestate.com/company/contact-us"
            target: "_blank"
        ,
            name: "Careers"
            link: "http://www.activestate.com/company/careers"
            target: "_blank"
        ]

        communicate: [
            name: "Contact Us"
            link: "/framed/?http://www.activestate.com/company/contact-us"
        ,
            name: "Blog"
        ,
            name: "Forums"
            link: "http://forum.komodoide.com/"
        ,
            name: "IRC"
            link: "http://kiwiirc.com/client/irc.mozilla.org/komodo?nick=komodo_visitor"
            target: "_blank"
        ,
            name: "Mailing Lists"
            link: "/framed/?http://code.activestate.com/lists#ActiveState"
        ]

        social: [
            name: "Twitter",
            img: "icons/sm/twitter-24x24.png",
            link: "http://twitter.com/KomodoIDE",
            target: "_blank"
        ,
            name: "Facebook",
            img: "icons/sm/facebook-24x24.png",
            link: "https://www.facebook.com/komodoide",
            target: "_blank"
        ,
            name: "Google+",
            img: "icons/sm/google+-24x24.png",
            link: "https://plus.google.com/u/0/115431120071336108525/posts",
            target: "_blank"
        ,
            name: "Vimeo",
            img: "icons/sm/vimeo-24x24.png",
            link: "https://vimeo.com/channels/komodo",
            target: "_blank"
        ,
            name: "GitHub",
            img: "icons/sm/github-24x24.png",
            link: "https://github.com/Komodo",
            target: "_blank"
        ,
            name: "StackOverflow",
            img: "icons/sm/stackoverflow-24x24.png",
            link: "http://stackoverflow.com/questions/tagged/komodo",
            target: "_blank"
        ,
            name: "RSS Feed",
            img: "icons/sm/feed-24x24.png",
            link: "#",
            target: "_blank"
        ]
}
