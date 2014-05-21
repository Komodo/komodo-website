---
title: Source Code Annotate Macro
author: Todd Whiteman
date: 2014-05-19
tags: [macro, javascript, scc, annotate, git, subversion]
description: Show source code file annotations inside the Komodo editor margin.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

When working with source code, it's often handy to know who last changed a
particular line of code - so you know who to point your finger at when s%!$
breaks. It just so happens there is a feature called *annotate* in the source
code control world that does exactly that.

## The Macro

This macro works for Git and Subversion (I'm lazy and haven't added support for
other VCS - pull requests are welcome), which will run a scc annotate operation
using Komodo's [Run Command][] service, parse the annotate output and place this
information in the left [editor margin].

Clicking on the annotate margin will launch the Komodo SCC History dialog for
that file.

## Screenshot

Note that the margin uses different colors to represent different commits, but
it doesn't guarantee that two adjacant commits do not share the same color.

<img src="/images/blog/2014-05/scc_annotate.png" style="vertical-align: middle">

## Running

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox][].

Execute the macro by double-clicking on the macro in the toolbox, or use the
Invoke Tool (Ctrl+Shift+K) to search/execute "annotate", or assign your own
keybinding to the macro. Run the macro again to remove the annotations.

<div class="inline centered">
<a href="/files/macros/SCC_Annotate.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/scc_annotate.js" target="_blank">View Source</a>
</span>
</div>

## Related Materials

* [Run Command Tutorial][] - what you can do with run commands in Komodo
* [Komodo Developer Extension][] - play around with JavaScript or Python code in
  the context of the Komodo window
* [Komodo Macro API][] - to programatically interact with the Komodo editor -
  available to both Python and Javascript
* [Editor API][] - the Komodo editor provides a wrapper around the Scintilla API


[Run Command]: https://github.com/Komodo/KomodoEdit/blob/trunk/src/run/koIRunService.idl#L367
[editor margin]: http://www.scintilla.org/ScintillaDoc.html#Margins
[Komodo toolbox]: /framed/?http://docs.activestate.com/komodo/8.5/toolbox.html
[Run Command Tutorial]: /framed/?http://docs.activestate.com/komodo/8.5/tutorial/runcmdtut.html
[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/8.5/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
