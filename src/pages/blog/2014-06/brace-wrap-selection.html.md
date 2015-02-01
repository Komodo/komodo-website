---
title: Automatic Brace Wrap for Editor Selections
author: Todd Whiteman
date: 2014-06-09
tags: [macro, javascript, editor, selection, wrap, brace, parenthesis, quote]
description: A Komodo startup macro that allows automatic wrapping of text selections by key-pressing the required brace character.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This is a startup macro (set to trigger when Komodo starts up) that will enable
brace wrapping on an editor selection. Once you make a selection, pressing any of
the brace or quote keys **( { [ " '** will automatically add a matching brace or
quote to the start and end points of the selection.

## Screenshot

Here's the macro in action, as I press the double-quote " key:

<img src="/images/blog/2014-06/brace_wrap_selection.gif" style="vertical-align: middle">

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

Once installed - open the Macro properties and set the macro to trigger on the
*Komodo startup event*.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/toddw-as--bracewrapselection/" class="button big primary">
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


[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/latest/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
