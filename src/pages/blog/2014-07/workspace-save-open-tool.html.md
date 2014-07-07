---
title: Easy Workspace Save and Open tool
author: Carey Hoffman
date: 2014-06-09
tags: [macro, javascript, quote, files, save, workspace, DOM]
description: A Komodo startup macro that injects a menu element at startup into the Tools menu, allowing users to save a current workspace(all the currently open files).
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This is a startup macro (set to trigger when Komodo starts up) that injects a
menu element ("Workspace") at startup into the Tools menu, allowing users to save a current
workspace(all the currently open files).

## About 

This is a pretty interesting macro, not only for utility but for learning.  I've
dug into some different aspects of Komodo that I haven't played with before or had
littler experience with:
1. [ko.filepicker](https://github.com/Komodo/KomodoEdit/blob/679c4465020309259cf95d0765962d6f785c2423/src/chrome/komodo/content/library/filepickers.p.js)
to using native file save/open dialogs.
2. [koFileEx](https://github.com/Komodo/KomodoEdit/blob/d3e7786b103c943b8af573b8c118ebf2dc347c8d/src/views/koFileEx.py)
to programmatically generate files.
3. Exploring ko.views.manager in the JS Shell in the Komodo Extension Developer
Add-on to see what information I could get from my open documents.
4. Using Komodos Dom Inspector to find necessary elements in the Tools menu to then use
the [xtk.domutils](https://github.com/Komodo/KomodoEdit/blob/d3e7786b103c943b8af573b8c118ebf2dc347c8d/src/chrome/xtk/content/domutils.js)
to create and append my new menu elements into the Komodo UI.

## Running

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

Once installed - open the Macro properties and set the macro to trigger on the
*Komodo startup event*.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/cgchoffman--workspacetool/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-macro" target="_blank">Install Instructions</a>
    </span>
</div>

## Related Materials

* [Komodo Developer Extension][] - play around with JavaScript or Python code in
  the context of the Komodo window
* [Komodo Macro API][] - to programatically interact with the Komodo editor -
  available to both Python and Javascript
* [Editor API][] - the Komodo editor provides a wrapper around the Scintilla API
* [DOM Inspector][]- the Komodo tool for inspecting DOM elements in Komodo


[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/8.5/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
[DOM Inspector]: http://komodoide.com/resources/addons/toddwhiteman--dominspector/
