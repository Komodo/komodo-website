---
title: Multi-row Editor Tabs for Komodo
author: Todd Whiteman
date: 2014-10-22
tags: [macro, javascript, tabs]
description: This little macro will wrap Komodo's editor tabs into multiple rows of tabs when there is not enough space to display all of them.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This is a JavaScript macro (best to set the macro to trigger on the Komodo
startup event) that wraps your editor tabs into multiple rows, making all the
tabs visible at once.

## Screenshot

Here's what is looks like with multiple tab rows:

<img src="/images/blog/2014-10/multi-row-editor-tabs.png" style="vertical-align: middle">

## Developer Notes

The JavaScript code for this macro is super ugly - but it shows some interesting
techniques (hacks) for accessing the anonymous DOM nodes (XBL) in Komodo's UI.

Note that it's actually a lot simpler to implement this directly using CSS
(using [Stylish][] or [userChrome.css][] with the following rules:

```CSS
/* Make the editor scroll tabs wrap around. */
#topview .arrowscrollbox-scrollbox {
	overflow: visible;
}
#topview .arrowscrollbox-scrollbox > box {
	display: inline-block;
}
```

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

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

## Related Materials

* [Komodo Developer Extension][] - play around with JavaScript or Python code in
  the context of the Komodo window
* [Komodo Macro API][] - to programatically interact with the Komodo editor -
  available to both Python and JavaScript
* [Editor API][] - the Komodo editor provides a wrapper around the Scintilla API


[Stylish]: http://komodoide.com/resources/addons/jasonbarnabe--stylish/
[userChrome.css]: http://community.activestate.com/faq/customizing-the-komodo-ui
[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/8.5/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
