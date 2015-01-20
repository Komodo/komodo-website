---
title: Go-lang Support for Komodo
author: Todd Whiteman
date: 2014-12-15
tags: [add-on, go, go lang]
description: Go programming language support is being introduced into Komodo!
layout: blog
---

## Go-lang Support

<img src="/images/blog/2014-10/golang-logo.png" align="right"/>

There has been a Komodo Go add-on available for a while now, but for Komodo 9
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

## Source Code

The code for the Go language support is open-source at GitHub, in the
[komodo-go] repository. We've love to hear from people trying the add-on, and
hopefull we'll see contributions from other users.

## Screenshot

<img src="https://github.com/Komodo/komodo-go/raw/master/example.png"/>

## Add-on History

The add-on was originally started by [Trent Mick][] as a general UDL language
extension back in 2010. Over the next few years [Travis Cline][] took it to the
next level, adding Syntax Checking, Codeintel Completions, Calltips and Goto
Definition support to the add-on (using [Gocode][]).
[Eric Promislow][] added smoother language integration (koIAppInfo) and language
preferences in 2013. We (the Komodo team) moved the code into the main Komodo
GitHub repository. I added Code Intelligence outlining (for Code Browser and
Sections List in Komodo IDE) and then included the add-on in the Komodo 9
default builds.

## Installation

For Komodo 9 users, the "Go Language" add-on is already included in your Komodo
installation.

For Komodo 8 users, visit the GitHub page to download and install the add-on.



[go programming]: https://golang.org/
[Gocode]: https://github.com/nsf/gocode
[godef]: http://godoc.org/code.google.com/p/rog-go/exp/cmd/godef
[komodo-go]: https://github.com/Komodo/komodo-go
[Trent Mick]: http://trentm.com/
[Travis Cline]: https://github.com/tmc
[Eric Promislow]: http://www.activestate.com/blog/authors/ericp
