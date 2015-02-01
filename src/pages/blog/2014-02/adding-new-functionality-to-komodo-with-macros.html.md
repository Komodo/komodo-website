---
title: Adding Functionality to Komodo With Macros
author: Todd Whiteman
date: 2014-02-24
tags: [macro, javascript, editor, column selection]
description: Does Komodo have feature X? What do you do when Komodo does not support a feature you've seen in another editor? After hearing this story multiple times, Todd will describe how you can add new functionality using Komodo macro's.
layout: blog
---

An interesting question came up on the Komodo community forums.

_In Editor X, I'm able to make a column selection, then for each column I'm
able to insert a number and have the number incremented for each subsequent row
in the selection. Does Komodo support this?_


# The Solution

First off, Komodo does not offer such a command out of the box - but we can
replicate this functionality by
[extending Komodo](http://docs.activestate.com/komodo/latest/extensions.html).

My extension tool of choice for this will be a
[Komodo macro](http://docs.activestate.com/komodo/latest/macros.html#macros_writing) -
as it's lightweight and great for user interfaces, user interactions and
it will also be able to programatically control the editor.


## Seeing It Work

First, in an editor file I make a rectangular selection. I used the
Alt+Shift+Arrow keyboard movements, but you can also hold down Alt (Cmd on Mac,
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
file into your [Komodo toolbox](http://docs.activestate.com/komodo/latest/toolbox.html).
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

* [DOM Inspector](http://community.activestate.com/xpi/dom-inspector)
  - to navigate and find existing Komodo UI elements
  - tweak CSS styling for the Komodo user interface
* [Komodo Developer Extension](http://community.activestate.com/node/1824)
  - play around with JavaScript or Python code in the context of the Komodo window
* [Komodo Macro API](http://docs.activestate.com/komodo/latest/macroapi.html)
  - to programatically interact with the Komodo editor
* [Scintilla API](http://www.scintilla.org/ScintillaDoc.html)
  - the Komodo editor provides a wrapper around the Scintilla API
