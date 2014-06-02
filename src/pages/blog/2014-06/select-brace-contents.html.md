---
title: Select Brace Contents
author: Nathan Rijksen
date: 2014-06-02 6:00
tags: [macro, javascript, editor, selections]
description: Easily select the contents of xml/html nodes by placing your cursor inside them and executing this macro.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Let's say you have the following snippet of html:
```html
<strong>This text is bold</strong>
```
With this macro you can simply put your cursor anywhere within the node contents 'and execute the macro to select the contents of the node (ie. the text).

This macro is very plain and fairly dumb, it will likely not be able to select
complex values (eg. sub-nodes). It currently only covers html "braces" (ok,
technically not braces), but support for other delimiters should be relatively
easy to add and is something I originally intended to include (hence the name),
and will likely add soon.

Feel free to fork and extend.


## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below. You'll want to hook the macro up to the "On Startup" trigger.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/naatan--selectbracecontents/" class="button big primary">
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
