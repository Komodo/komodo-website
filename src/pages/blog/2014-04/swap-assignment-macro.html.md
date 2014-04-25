---
title: Swap Assignment Macro
author: Todd Whiteman
date: 2014-04-28
tags: [macro, javascript, editor, print, dump]
description: Quickly swap variable assignments around, or switching argument positions.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

It's a common idiom to swap things around in your code, either swapping the
position of two function arguments, or changing the assignment of variables
around in a save and restore operation. This is not often done, but when you
need to do it, this macro will save you a lot of time... I end up using this
macro around once per day.

# Examples

Given this piece of JavaScript assignment code:

```javascript
window.myvariable = window.somefield;
```

when you select this piece of code and invoke the macro, you'd get the code
assignment swapped into this:

```javascript
window.somefield = window.myvariable;
```

Another use case is to swap the position of function arguments:

```python
def myfunction(arg1, arg2):
    print(arg1, arg2)
myfunction("one", "two")
```

If you select *arg1, arg2*, or select *"one", "two"* and run the macro you'd
swap those arguments around:

```python
def myfunction(arg2, arg1):
    print(arg2, arg1)
myfunction("two", "one")
```


## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](/framed/?http://docs.activestate.com/komodo/8.5/toolbox.html).

To use the macro, make an editor selection and then invoke the macro - by
double-clicking on the macro in the toolbox, using the Invoke Tool
(Ctrl+Shift+K) to search/execute "swap assignment", or assigning your own
keybinding to the macro.

<div class="inline centered">
<a href="/files/macros/Swap_Assignment.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/swap_assignment.js" target="_blank">View Source</a>
</span>
</div>

## Related Materials

* [Komodo Developer Extension](/framed/?http://community.activestate.com/node/1824)
  - play around with JavaScript or Python code in the context of the Komodo window
* [Komodo Macro API](/framed/?http://docs.activestate.com/komodo/8.5/macroapi.html)
  - to programatically interact with the Komodo editor - available to both
    Python and Javascript
* [Editor API](http://www.scintilla.org/ScintillaDoc.html)
  - the Komodo editor provides a wrapper around the Scintilla API
