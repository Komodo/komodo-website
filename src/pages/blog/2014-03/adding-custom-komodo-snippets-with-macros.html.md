---
title: Adding Custom Snippets to Komodo With Macros
author: Carey Hoffman
date: 2014-02-24
tags: [macro, javascript, editor, snippets, komodo core]
description: Does Komodo not come with a snippet you need?  Carey is going to show you how to create that snippet with one keybinding using Komodo macro's.  We heard you liked keybindings too, so we're gonna put a keybinding in that keybindinged snippet.
layout: blog
---

An interesting question came up on the Komodo community forums.

_In Komodo has so many preinstalled code snippets that are SO HANDY, but I need
THIS one *highlights text*.  I wish I could just press a button and Komodo would
create a new snippet for me!?_


## The Story Behind The Macro

Being part of the support team, I'm often in the [Komodo community forums]
(http://community.activestate.com/forums/komodo/).  Oddly enough, people ask a
lot of question there which I'm more than happy to answer.  Recently I was lucky
enough to come across a post entitled [heap o' queations](http://community.activestate.com/node/10713).
Needless to I was excited!  I dove right into analyzing the obviously well organized and
thought out questions from the user.


## The Method

The part that grabbed my attention the most was the request for a macro that
could automatically generate snippets from selected code.  This was already
possible through _In drap and drop?_ but I found this keybound suggestion
interesting.  Since the drag and drop method must use some function to generate
a snippet I knew it already existed in Komodo.  Komodo is that is almost entirely
controlled by Javascript (and Python), and our macros can be written in Javascript
(or Python) so any function within Komodo is accessible to you through macros.
We use [{OpenGrok}](http://opengrok.github.io/OpenGrok/) to
[grok Komodo source](http://opengrok.activestate.com/source/) and you should too.

I started simple; I opened [Komodos Extension Developer](http://community.activestate.com/node/1824),
and opened Komodos OpenGrok in a browser and search for something obvious...

![Step 1](/images/blog/2014-03/carey-addsnippet.PNG)

the second result looked promising...

![Step 1](/images/blog/2014-03/carey-addsnippet-results.PNG)

Clicking _Inthis.addSnippet...?_ took me right to that code.  As promising as that
function looked I thought _Inthis.addSnippetFromText?_ looked even more interesting.

Now I need some text


## Seeing It Work

First, in an editor file I make a rectangular selection. I used the
Ctrl+Alt+Arrow keyboard movements, but you can also hold down Alt (Cmd on Mac,
Alt on Linux) key and Mouse select the rectangular region.

![Step 1](/images/blog/2014-02/incremental_number_screenshot_1.png)

then use the **Tools > Insert Column Numbers** menu to bring up the interface,

![Step 2](/images/blog/2014-02/incremental_number_screenshot_2.png)

customize the values as necessary and press ENTER (or click OK)

![Step 3](/images/blog/2014-02/incremental_number_screenshot_3.png)

which inserts the numbers as required and maintains the selection positions

![Step 4](/images/blog/2014-02/incremental_number_screenshot_4.png)

allowing you to insert additional follow-on characters as required, I've typed
". " which results in the final text looking like this

![Step 5](/images/blog/2014-02/incremental_number_screenshot_5.png)


## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](/framed/?http://docs.activestate.com/komodo/8.5/toolbox.html).
Once in your toolbox double click the macro to activate it. The macro will
automatically activate itself the next time you start Komodo, you only need to
do this manually the first time.

<div class="inline centered">
<a href="/files/macros/Column_Incremental_Numbering.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/column_incremental_numbering.js" target="_blank">View Source</a>
</span>
</div>

## How Does it Work?

The macro is designed to be run once at Komodo startup - which is set through
the macro properties dialog. When it executes, it stores JavaScript functions
under the **extensions.columnnumber.** namespace and then sets up a new Tools
menu item that will launch the UI.

When the UI is launched, it creates the textboxes, labels, button elements, and
then listens for user interactions. Note that the Komodo UI is much like a web
page, it has a DOM based structure which you can interact with using JavaScript
APIs and style using CSS.


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
