---
title: Run SSH Commands from Komodo
author: Carey Hoffman
date: 2014-06-23
tags: [macro, javascript, editor, ssh, commands]
description: Execute a remote command through SSH based on the connection to a remote file in the editor
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This macro is currently set up to execute a single command, "ls -la", on the remote
machine.  It piggy backs on the current connection used to access the remote file
in the editor window.  Therefore you must have a remote file open when you run it.
You could also modify this to ask you for the command to execute using [Interpolation %ask Shortcut][].

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

Once installed - open the Macro properties and set the macro to trigger on a
keybinding of your choice.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/cgchoffman--sshcommands/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-macro" target="_blank">Install Instructions</a>
    </span>
</div>

## Share Your Own Awesome Macros

Do you have your own awesome macro's that you think others could benefit from?
Submit them to the [Resources Section] and if you really want to get it noticed
[write a Macro Monday blog about it][macromonday].

   [Resources Section]: /resources/submit-instructions/#pane-resources
   [macromonday]: /resources/submit-instructions/#pane-blogs

## Related Materials

* [Komodo Developer Extension][] - play around with JavaScript or Python code in
  the context of the Komodo window
* [Komodo Macro API][] - to programatically interact with the Komodo editor -
  available to both Python and Javascript
* [Editor API][] - the Komodo editor provides a wrapper around the Scintilla API
* [Interpolation %ask Shortcut][] - Add input from user into your macros using ```%ask```
interpolation.


[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/8.5/macroapi.html
[Editor API]: http://www.scintilla.org/ScintillaDoc.html
[Interpolation %ask Shortcut]:http://docs.activestate.com/komodo/8.5/shortcuts.html#shortcuts_askcode_options
