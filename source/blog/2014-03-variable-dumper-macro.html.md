---
title: Variable Dumper Macro
author: Todd Whiteman
date: 2014-03-24
tags: [macro, javascript, editor, print, dump]
description: Quickly create a print statement from a variable or selection of code. This is one of Todd's most frequently used macros!
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

For quick and simple debugging of code at runtime, I will often use a print or
log statement to check what a variable is set to. This macro quickly creates the
boilerplate for the print statement according to the language I am currently
editing.

# Examples

Given this piece of JavaScript code:

```javascript
window.myvariable = someFunction(x, y, z);
```

if you place your caret anywhere in the *myvariable* word, then invoke the
macro, you'd see a *console.log()* statement on the next available line:

```javascript
window.myvariable = someFunction(x, y, z);
console.log('window.myvariable: ', window.myvariable);
```

and when using Python code, the macro would generate a *print()* statement
instead:

```python
window.myvariable = someFunction(x, y, z)
print('window.myvariable: %r' % (window.myvariable, ))
```

## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](http://docs.activestate.com/komodo/latest/toolbox.html).
Once in your toolbox double click the macro to activate it. The macro will
automatically activate itself the next time you start Komodo, you only need to
do this manually the first time.

<div class="inline centered">
<a href="/files/macros/Variable_Dumper.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/variable_dumper.js" target="_blank">View Source</a>
</span>
</div>

## Related Materials

* [Komodo Developer Extension](http://community.activestate.com/node/1824)
  - play around with JavaScript or Python code in the context of the Komodo window
* [Komodo Macro API](http://docs.activestate.com/komodo/latest/macroapi.html)
  - to programatically interact with the Komodo editor
* [Editor API](http://www.scintilla.org/ScintillaDoc.html)
  - the Komodo editor provides a wrapper around the Scintilla API
