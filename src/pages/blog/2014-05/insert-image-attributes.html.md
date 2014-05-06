---
title: Img Tag Dimension Completion
author: Carey Hoffman
date: 2014-05-05
tags: [macro, javascript, editor, html, image, attributes, img]
description: Quickly add image dimensions to an <img> tag based off the image tags src attribute.  Everyone wants it, now you've got it.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Quickly add image dimensions to an <img> tag based off the image tags src
attribute.  Everyone wants it, now you've got it.

## The Things I Need

How often have you entered an image tags src attribute and thought "GO!...Fill it
in...Please?"?  I know I have.  Atleast twice.

Others have had similar thoughts and one such user [requested this of Komodo](http://community.activestate.com/forum/html-editing-img-tag-expansion-etc#comment-6695)
some time ago.  EricP answered the call and gave the user something that worked.

It uses the [Image() object](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Canvas_tutorial/Using_images#Creating_an_image_from_scratch)
in Javascript that allows us to load the image then pulls some information
from it and use it to append *height* and *width* attributes to the image tag
you're working in.

I've updated it to use the *load* event to be sure the image is ready when I pull
properties off of it.  I've also created a full path for the image which
ToddW says will bite me in the @$$ later but only time will tell.

## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](/framed/?http://docs.activestate.com/komodo/8.5/toolbox.html).

To use the macro, make an editor selection and then invoke the macro - by
double-clicking on the macro in the toolbox, using the Invoke Tool
(Ctrl+Shift+K) to search/execute "swap assignment", or assigning your own
keybinding to the macro.  Click on the link below and have a look at the source
for yourself.

<div class="inline centered">
<a href="/files/macros/Swap_Assignment.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/img_dimensions.js" target="_blank">View Source</a>
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
