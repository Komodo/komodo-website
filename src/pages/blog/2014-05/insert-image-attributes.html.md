---
title: Image Tag Dimension Completion
author: Carey Hoffman
date: 2014-05-05
tags: [macro, javascript, editor, html, image, attributes, img]
description: Quickly add image dimensions to an &lt;img&gt; tag based off the image tags src attribute.  Everyone wants it, now you've got it.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Quickly add image dimensions to an &lt;img&gt; tag based off the image tags src
attribute. Everyone wants it, now you've got it.

## The Things I Need

How often have you entered an image tags src attribute and thought "GO!...Fill it
in... Please?"?  I know I have.  At least twice.

Others have had similar thoughts and one such user [requested this of Komodo](http://community.activestate.com/forum/html-editing-img-tag-expansion-etc#comment-6695)
some time ago.  EricP answered the call and gave the user something that worked.

It uses the [Image() object](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Canvas_tutorial/Using_images#Creating_an_image_from_scratch)
in Javascript that allows us to load the image then pulls some information
from it and use it to append *height* and *width* attributes to the image tag
you're working in.

I've updated it to use the *load* event to be sure the image is ready when I pull
properties off of it.  I've also created a full path for the image which
[ToddW](http://komodoide.com/authors/#ToddWhiteman) says will bite me in the @$$ later but only time will tell.

## Installation

To install the macro simply hit the "View Resource" button below, for instructions
on how to install it refer to the [Install Resources Documentation](http://komodoide.com/resources/install-instructions/#pane-macro).

To use the macro, make an editor selection and then invoke the macro - by
double-clicking on the macro in the toolbox, using the Invoke Tool
(Ctrl+Shift+K) to search/execute "swap assignment", or assigning your own
keybinding to the macro.  Click on the link below and have a look at the source
for yourself.

<a href="" class="button primary">
    <i class="icon icon-eye"></i>
    View Resource
</a>
