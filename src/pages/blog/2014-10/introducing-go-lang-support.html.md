---
title: Go-lang Support for Komodo
author: Todd Whiteman
date: 2099-10-22
tags: [add-on, go, go lang]
description: Go programming language support is being introduced into Komodo!
layout: blog
---

## Go-lang Support

There has been a Komodo Go add-on available for a while now, but in Komodo 9
will be including the go-lang add-on in the default Komodo builds and improving
Komodo's support for [go programming].

## Features

The add-on currently supports 

* Language detection of .go files
* Syntax Coloring
* Code Folding
* Syntax Checking (aka Linting)
* Codeintel Completions and Calltips (requires [Gocode][] to be installed)
* Code Outline (for Code Browser and Sections List in IDE)
* Go to Definition (requires [godef][] to be installed)

TODO: Add a nice go-lang image:
<img src="/images/blog/2014-10/go-lang" style="vertical-align: middle">

## Source Code

The code for the Go language support is open-source at GitHub, in the
[komodo-go] repository. We've love to hear from people trying the add-on, and
hopefull we'll see contributions from other users.

## Add-on History

The add-on was originally started by [Trent Mick][] as a general UDL language
extension back in 2010. Over the next few years [Travis Cline][] took it to the
next level, adding Syntax Checking and Goto Definition support to the add-on.
[Eric Promislow][] added smoother language integration (koIAppInfo) and language
preferences in 2013. We (the Komodo team) moved the code into the main Komodo
GitHub repository. I added Code Intelligence outlining (for Code Browser and
Sections List in Komodo IDE) and then included the add-on in the Komodo 9
default builds.

## Installation

For Komodo 9 users, there should already be a "Go Language" add-on included in
your Komodo installation.

For Komodo 8 users, here's the install instructions:

Once installed - invoke the macro on demand or set the macro to run on the
Komodo startup event.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/toddw-as--multi-row-editor-tabs/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-macro" target="_blank">Install Instructions</a>
    </span>
</div>


[go programming]: https://golang.org/
[Gocode]: https://github.com/nsf/gocode
[godef]: http://godoc.org/code.google.com/p/rog-go/exp/cmd/godef
[komodo-go]: https://github.com/Komodo/komodo-go
[Trent Mick]: http://trentm.com/
[Travis Cline]: https://github.com/tmc
[Eric Promislow]: http://www.activestate.com/blog/authors/ericp
