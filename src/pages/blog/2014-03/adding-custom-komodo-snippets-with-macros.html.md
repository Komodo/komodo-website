---
title: Adding Custom Snippets to Komodo With Macros
author: Carey Hoffman
date: 9999-03-10
tags: [macro, javascript, editor]
description: Does Komodo not come with a snippet you need?  I'll show you how to create that snippet with one keybinding using Komodo macro's.  We heard you liked keybindings too, so we're gonna put a keybinding in that keybound snippet.
layout: blog
---

## The Story Behind The Macro

Being part of the support team, I'm often in the Komodo community forums enough, people
ask alot of question there which I'm more than happy to answer.  Recently I was lucky
enough to come across a post entitled [heap o' queations](http://community.activestate.com/node/10713).
Needless to I was excited!  I dove right into analyzing the obviously well organized and
thought out questions from the user.  A short 10 days later and we're done!  Wooh!

The part that grabbed my attention the most was the request for a macro that
could automatically generate snippets from selected code then add a keybinding and a
name.  This was already partially possible through Drap and Drop and the
_"Add as snippet into Toolbox"_ command under **Preferences > Editor > Keybindings**.
I just had to add the keybinding and the name.  Since the ability to generate a
snippet from text must already existed in Komodo given the existing commands, I
decided to try to augment.


## Komodo Tools and Functions

The interesting thing about Komodo is that it's almost entirely controlled by
Javascript and Python.  Our macros can be written entirely in those languages and
are run side by side all the core Komodo code. This means any function within Komodo
is accessible to you through macros.  You can easily search the [Komodo Edit code base](https://github.com/Komodo/KomodoEdit)
now that [it's on github](http://komodoide.com/blog/2014-03/komodo-edit-is-now-on-github/).

### Create a Snippet Object

I started simple; I opened [Komodos Extension Developer](http://community.activestate.com/node/1824)
Javascript Shell and Komodo Github then searched for _addsnippet_...

![Find the function](/images/blog/2014-03/carey-addsnippet.PNG)

That first result looked promising.  When I inspected the code though I saw something
even more interesting, `this.addSnippetFromText()`.  I had my
function.  

I can try this command in the Javascript Shell I mentioned above that comes
with _The Extention Developer_ addon: **Tools > Extension Developer > Javascript Shell**.
Note there is some JSFu going on in this file; at the bottom, line ~563, you'll see

```javascript
}).apply(ko.projects);
```

which means "this" is being "applied" to the ko.project object which you can see
instantiated at the top of the file.  To run the function in the JS Shell descend
into the `ko.projects` object:

```javascript
ko.projects.addSnippetF //press TAB here to get completions.
```

### Komodo Macro API

Now I need some text.  This is where the Komodo Macro API comes in handy.  [Komodo Scimoz](http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_js)
is the current buffer, the code you currently see in your editor screen. The
Scimoz object has a [selText attribute](http://docs.activestate.com/komodo/8.5/macroapi.html#selText)
which is exactly what I'm looking for.
Try this in the JS Shell with a file open (select some text...):

```javascript
var scimoz = ko.views.manager.currentView.scimoz

scimoz.selText
This is what i'm pretending I had selected in a file
```
So now I can create a snippet object from selected text:

```javascript
var snippet = ko.projects.addSnippetFromText(scimoz.selText)
[xpconnect wrapped (nsISupports, nsIObserver, koIPart_Common, koITool)]

snippet.type
snippet

snippet.value
This is what i'm pretending I had selected in a file
```
    
![Create Snippet in Console](/images/blog/2014-03/create-snippet-console.PNG)

### Komodo Interpolation

Now I need a name.  Why not ask the user what they want to call it?  That's where
[Komodo Interpolation function](http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_interpolate)
comes in handy with its [interpolation shortcuts](http://docs.activestate.com/komodo/8.5/shortcuts.html#shortcuts_top).
I won't pretend like I nailed this down first try but it's straigh forward
once you get the syntax worked out.  There are lots of examples in the [Komodo Community Forums](http://community.activestate.com/forums/komodo)
but you can also [check out the code I used for this snippet](https://github.com/Komodo/macros/blob/master/automagic_snippets_from_text.js#L24).

Try it out in the Javascript shell:

```javascript
ko.interpolate.interpolateStrings("%(ask:Snippet Name: PIZZA")
```

### Open Snippet Propeties

The last step was to access the snippet properties so I could add a keybinding
quickly (sorry softmoon-webware, it was too much work to catch keybindings randomly).
I had my snippet object already.  There had to be a way to open a snippets properties
now.  I went out on a limb and checked the [peSnippets.js file,
searching `snippetProperties`](https://github.com/Komodo/KomodoEdit/blob/9bd4f2abe7f1263f4328d5f1248759056a33e2bd/src/chrome/komodo/content/project/peSnippet.js#L113) with Ctrl + F:

```javascript
this.snippetProperties = function snippet_editProperties (item)
{
   ...
}
```

Well why don't I pass my new snippet to this function as `item`:

```javascript
ko.projects.snippetProperties(snippet)
```
 
**BAM!**

![Find the function](/images/blog/2014-03/snippet-properties.PNG)

Putting all those pieces together in a [Komod macro](http://docs.activestate.com/komodo/8.5/macros.html#macros_writing)
and I was done:

```javascript
// Create a base snippet with the selected text
scimoz = ko.views.manager.currentView.scimoz;
var snip =
   ko.projects.addSnippetFromText(scimoz.selText);
//create a date to be used as a unique name on the snippet
var d = new  Date();
// Create a unique default name string
var defaultName = "New Snippet - " + d.toLocaleTimeString().substr(0,8).trim()
// Ask for a name or provide the unique default
var name = ko.interpolate.interpolateStrings("%(ask:Snippet Name: " +
                                             defaultName + ")")
// Assign the name to the snippet name attribute
snip.name = name;
// Open the snippet options to set a keybinding
ko.projects.snippetProperties(snip);
```
    
Another Monday, another macro.  It's fun making your tools sharper.

## Related Materials

* [DOM Inspector](/framed/?http://community.activestate.com/xpi/dom-inspector)
  - to navigate and find existing Komodo UI elements
  - tweak CSS styling for the Komodo user interface
* [Komodo Developer Extension](/framed/?http://community.activestate.com/xpi/dom-inspector)
  - play around with JavaScript or Python code in the context of the Komodo window
* [Komodo Macro API](/framed/?http://docs.activestate.com/komodo/8.5/macroapi.html)
  - to programatically interact with the Komodo editor
* [Scintilla API](http://www.scintilla.org/ScintillaDoc.html)
  - the Komodo editor provides a wrapper around the Scintilla API
