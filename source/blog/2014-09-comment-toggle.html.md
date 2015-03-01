---
title: Macro for Toggling Editor Comments
author: Todd Whiteman
date: 2014-09-08
tags: [macro, javascript, editor, selection, wrap, brace, parenthesis, quote]
description: Toggle comments (on or off) for the current editor line, or over the selected lines.
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This is an on-demand Python macro (most useful with a keybinding) that will
allow you to toggle comments on/off over the selected editor lines (or the
current editor line when there is no selection).

I use the Ctrl+3 keybinding, overriding the default "Comment" command, as this
way I never have to use the Ctrl+2 "UnComment" command, I just have the one
keybinding to turn comments on or off.

## Screenshot

Here's the macro in action:

<img src="/assets/images/blog/2014-09/comment_toggle.gif" style="vertical-align: middle">

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

Once installed - open the Macro properties and set the keybinding to Ctrl+3 (or
whatever custom keybinding you like).

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/toddw-as--commenttoggle/" class="button big primary">
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


[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/latest/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
