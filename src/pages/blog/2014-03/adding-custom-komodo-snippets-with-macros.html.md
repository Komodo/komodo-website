---
title: Macro Monday: Quickly Adding Custom Snippets
author: Carey Hoffman
date: 2014-03-10
tags: [macro, javascript, editor]
description: Does Komodo not come with a snippet you need?  I'll show you how to create that snippet with one keybinding using Komodo macros.  We heard you liked keybindings too, so we're gonna put a keybinding in that keybound snippet.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

## The Story Behind The Macro

Being part of the support team, I'm often enough in the Komodo community forums, people
ask a lot of question there which I'm more than happy to answer.  Recently I was lucky
enough to come across a post titled [heap o' queations](http://community.activestate.com/node/10713),
needless to say I was excited!  I dove right into analyzing the well organized and
thought out questions.

The part that grabbed my attention the most was the request for a macro that
could automatically generate a snippet from selected code, then add a keybinding and a
name.  This was already partially possible through Drap and Drop and the
_"Add as snippet into Toolbox"_ command under **Preferences > Editor > Keybindings**.
However I still had to manually add the keybinding and the name.  Since the ability to generate a
snippet from text already existed in Komodo given the existing commands, I
decided to try to augment.

## Exploring Komodo

The interesting thing about Komodo is that it's almost entirely controlled by
Javascript and Python.  Our macros can be written entirely in those languages and
are run alongside the core Komodo code. This means any function within Komodo
is accessible to you through macros. You can easily search the [Komodo Edit code base](https://github.com/Komodo/KomodoEdit)
now that [it's on github](http://komodoide.com/blog/2014-03/komodo-edit-is-now-on-github/).

### Creating the Snippet

I started simple; I opened [Komodo Edit on Github](https://github.com/Komodo/KomodoEdit)
then searched for _addsnippet_...

![Find the function](/images/blog/2014-03/carey-addsnippet.PNG)

That first result looked promising.  When I inspected the code though I saw something
even more interesting; `this.addSnippetFromText()` -- I had my function.

Note there is some JSFu going on in this file; at the bottom, line ~563, you'll see

```javascript
}).apply(ko.projects);
```

which means the object is being "applied" to the ko.project object which you can see
instantiated at the top of the file.  To run the function I need to descend
into the `ko.projects` object, I can try this command in the [Komodos Extension Developer](http://community.activestate.com/node/1824) Javascript Shell:
*Tools > Extension Developer > Javascript Shell*.

```javascript
ko.projects.addSnippetF //press TAB here to get completions.
```

### Using the Macro API

Now I need some text to pass into my function.  This is where the [Komodo Macro]((http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_js))
API comes in handy. Komodo Scimoz is the current buffer, the code you currently
see in your editor screen. The [Scimoz object](http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_scimoz)
has a [selText attribute](http://docs.activestate.com/komodo/8.5/macroapi.html#selText)
which is exactly what I'm looking for.
Lets try this in the Javascript shell with a file open and some text selected:

```javascript
var scimoz = ko.views.manager.currentView.scimoz
scimoz.selText
```

That returns the text I have selected in my editor. So now I can create a snippet
object from selected text:

```javascript
var snippet = ko.projects.addSnippetFromText(scimoz.selText)
```

Now typing `snippet.value` in the Javascript shell will return my selected text.

![Create Snippet in Console](/images/blog/2014-03/create-snippet-console.PNG)

### Inserting User Input

Now I need a name.  Why not ask the user what they want to call it?  That's where
[Komodo Interpolation function](http://docs.activestate.com/komodo/8.5/macroapi.html#macroapi_interpolate)
comes in handy with its [interpolation shortcuts](http://docs.activestate.com/komodo/8.5/shortcuts.html#shortcuts_top).
I won't pretend like I nailed this down first try but it's straight forward
once you get the syntax worked out.  There are lots of examples in the [Komodo Community Forums](http://community.activestate.com/forums/komodo)
but you can also [check out the code I used for this snippet](https://github.com/Komodo/macros/blob/master/automagic_snippets_from_text.js#L24).
You can also access the different shortcuts from within the Snippet properties
dialog (the small arrow to the right of the text field).

Try it out in the Javascript shell:

```javascript
ko.interpolate.interpolateString("%(ask:Snippet Name: PIZZA")
```

### Open Snippet Propeties

The last step was to access the snippet properties so I could add a keybinding
quickly. I had my snippet object already.  There had to be a way to open a snippets properties
now.  I went out on a limb and checked the [peSnippets.js file,and found "snippetProperties"](https://github.com/Komodo/KomodoEdit/blob/9bd4f2abe7f1263f4328d5f1248759056a33e2bd/src/chrome/komodo/content/project/peSnippet.js#L113).
Well why don't I pass my new snippet to this function:

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
var snip = ko.projects.addSnippetFromText(scimoz.selText);

//create a date to be used as a unique name on the snippet
var d = new Date();

// Create a unique default name string
var defaultName = "New Snippet - " + d.toLocaleTimeString().substr(0,8).trim()

// Ask for a name or provide the unique default
var name = ko.interpolate.interpolateString("%(ask:Snippet Name: " + defaultName + ")")

// Assign the name to the snippet name attribute
snip.name = name;

// Open the snippet options to set a keybinding
ko.projects.snippetProperties(snip);
```

Another Monday, another macro.  It's fun making your tools sharper.

## Try it Yourself

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](/framed/?http://docs.activestate.com/komodo/8.5/toolbox.html).
Once in your toolbox you can assign it a keybind via the Macro properties (right click > Properties) or by accessing it directly from your toolbox.

<div class="inline centered">
<a href="/files/macros/Create_Snippet_From_Selected_Text.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/automagic_snippets_from_text.js" target="_blank">View Source</a>
</span>
</div>

## Related Materials

* [Komodo Developer Extension](/framed/?http://community.activestate.com/xpi/dom-inspector)
  - play around with JavaScript or Python code in the context of the Komodo window
* [Komodo Macro API](/framed/?http://docs.activestate.com/komodo/8.5/macroapi.html)
  - to programatically interact with the Komodo editor
