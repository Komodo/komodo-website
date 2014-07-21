---
title: Open the same file in another locations
author: Todd Whiteman
date: 2014-07-21
tags: [macro, javascript, alternative, file, open]
description: This macro allows opening the current file in another location, such as an alternative branch location.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Macro

This is a startup macro (set to trigger when Komodo starts up) that creates a
new editor tab context menu, to allow opening the current file in an alternative
location. The alternative locations are read from the *locations.ini* file in
the Komodo profile directory.

## Screenshot

Here's a screenshot showing the tab context menu for my configuration:

<img src="/images/blog/2014-07/alternative-location.png" style="vertical-align: middle">

## Locations Configuration File

Here is my "locations.ini" config file on Linux:

```ini
# Anything starting with # is a comment.

komodo ide   = /as/komodo-devel

clean branch = /as/komodo-devel_clean

8.5.x branch = ~/as/komodo-devel_8.5.x

komodo edit  = /as/komodo-edit
```

Given the above configuration, if I had this file open in Komodo:
```
  /as/komodo-devel/src/libs/controller.js
```
I could right click on the tab, choose "Open at location > 8.5.x branch", and Komodo
would open this file:
```
  ~/as/komodo-devel_8.5.x/src/libs/controller.js
```

Note that the current file needs to be matched to one of the configuration
directories, otherwise there would be no way to determine the relative path. The
macro gives a warning in such a case.

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below.

Once installed - open the Macro properties and set the macro to trigger on the
*Komodo startup event*.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/toddw-as--alternativelocation/" class="button big primary">
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


[Komodo Developer Extension]: /framed/?http://community.activestate.com/node/1824
[Komodo Macro API]: /framed/?http://docs.activestate.com/komodo/8.5/macroapi.html
