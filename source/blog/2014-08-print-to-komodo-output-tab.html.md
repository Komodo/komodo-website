---
title: Print to the Komodo Output Tab
author: Carey Hoffman   
date: 2014-08-18 06:00
tags: [javascript, command output, shell, print, custom, macro]
description: Manually print to output tab in Komodo.
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

I came across a macro that Eric Promislow had written a few years ago that seemed
pretty interesting, [How do you write to the Command Output Window](http://community.activestate.com/faq/how-do-you-write-command-output-window)?
Its a bit out dated since Mark Yen added customizable tab layouts but that was an
easy fix.  All tabs are now their own widgets so to access their attributes you
have to retrieve the widget first.  That's basically the only change I had to make
to Eric's version.

I also added some commented code you'll notice.  There are a few ways this macro
could be useful but the most useful would be to be used by other macros that have
output.  As it stands, you would set this macro up to run at Komodo startup.
That would add the new function to the live code base and allow you to use it by
callig it from other macros that may want to print to the output pane.

You could also run it manually and have it ask you for input.  I don't know
why you would do this but I'm not you and you're great so you can do whatever
you want.  You would uncomment lines 16 through 18 and line 49.  Hopefully those
line numbers are still relevant when you're reading this ;)

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

<div class="centered">
    <div class="spacer"></div>
    <a href="/resources/macros/cgchoffman--printtooutputpane/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-macro" target="_blank">Install Instructions</a>
    </span>
</div>

## Share Your Own Macros

Have you written your own macros that you think others could benefit from?
Submit them to the [Resources Section] and if you really want to get it noticed
[write a Macro Monday blog about it][macromonday].

   [Resources Section]: /resources/submit-instructions/#pane-resources
   [macromonday]: /resources/submit-instructions/#pane-blogs
