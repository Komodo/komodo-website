---
title: Komodo 8.5.4 release is now available
author: Todd Whiteman
date: 2014-08-21
tags: [release, official, download]
description: Komodo 8.5.4 has been released - containing bug fixes and improvements.
layout: blog
---

On behalf of the Komodo team, I am happy to announce the release of Komodo
8.5.4. This build contains important bug fixes and is a recommended update for
all Komodo 8 users.

If your already using Komodo 8, then use the *Help > Check for Updates* menu to
start the update, else you can obtain a copy by visiting the
[downloads](/download) section.

<div class="centered">
    <div class="spacer"></div>
    <a href="/download" class="button big primary">
        <i class="icon icon-download"></i>
        Download Komodo 8.5.4
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-bug"></i>
        <a href="https://bugs.activestate.com/enter_bug.cgi?product=Komodo&version=8.5.4" target="_blank">Report a Bug</a>
    </span>
</div>

## Release Highlights

This release fixes a number of important bugs, including the following:

* Windows high DPI font rendering and positioning issues (Bug [100492](http://bugs.activestate.com/show_bug.cgi?id=100492))
* PHP memory leaks from codeintel file scanning (out-of-memory errors) (Bug [102643](http://bugs.activestate.com/show_bug.cgi?id=102643))
* Python 3.4 debugging fix (Bug [103631](http://bugs.activestate.com/show_bug.cgi?id=103631))

### Other Changes

*    Code Intelligence: CSS: Show pseudo completions after colon. (Bug [104799](https://bugs.activestate.com/show_bug.cgi?id=104799))
*    Code Intelligence: JavaScript: Ensure document completions work inside of HTML. (Bug [102993](http://bugs.activestate.com/show_bug.cgi?id=102993))
*    Debugging: Tcl: Update appLaunch.tcl file. (Bug [101199](http://bugs.activestate.com/show_bug.cgi?id=101199))
*    Editor: Automatically enable word-wrap when a file has long lines. (Bug [93790](http://bugs.activestate.com/show_bug.cgi?id=93790))
*    Editor: Django: Highlight *elif* tag, *elseif* in Twig (and improve auto-indent). (Bug [101792](http://bugs.activestate.com/show_bug.cgi?id=101792))
*    Editor: When changing case in column selection, stay in column selection. (Bug [100269](http://bugs.activestate.com/show_bug.cgi?id=100269))
*    Find: Ensure find markers are not added more than once. (Bug [104553](http://bugs.activestate.com/show_bug.cgi?id=104553))
*    Find: Stop find options from changing when using multi caret commands. (Bug [103329](http://bugs.activestate.com/show_bug.cgi?id=103329))
*    Places: After creating a new file, open it and display it in places. (Bug [94287](http://bugs.activestate.com/show_bug.cgi?id=94287))
*    Places: Cull deleted items in places history menu. (Bug [98684](http://bugs.activestate.com/show_bug.cgi?id=98684))
*    Preferences: Indentation Settings: Allow per language settings to be saved. (Bug [99431](http://bugs.activestate.com/show_bug.cgi?id=99431))
*    Projects: When opening a new project is aborted, keep the old project on the MRU list. (Bug [94201](http://bugs.activestate.com/show_bug.cgi?id=94201))
*    SDK: Ensure koext startlang works with --is-html-based argument (Bug [104551](http://bugs.activestate.com/show_bug.cgi?id=104551)).
*    Source Code: Checkout: Remember the checkout textbox url. (Bug [99395](http://bugs.activestate.com/show_bug.cgi?id=99395))
*    Source Code: Git: Ensure git submodules are properly detected in commit dialog. (Bug [95701](http://bugs.activestate.com/show_bug.cgi?id=95701))
*    Syntax Checking: Python: Reinstate passing --rcfile to pylint. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*    Syntax Checking: Python: Tell pylint where to find .pylintrc. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*    Toolbox: Stop duplication of snippets when dropping snippet text. (Bug [103113](http://bugs.activestate.com/show_bug.cgi?id=103113))
*    UI: Re-enable word-wrap in output panels (command output, debugger output). (Bug [98471](http://bugs.activestate.com/show_bug.cgi?id=98471))

## Any Questions?

If you've got any questions, post a comment below or [talk to us directly on the
forums!](http://forum.komodoide.com/)
