---
title: Character Transpose
author: Carey Hoffman
date: 2014-05-26
tags: [macro, javascript, editor, html, image, attributes, img]
description: Swap character order using the transpose macro.   Easily augmented to swap whole words as well when word is selected.
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Swap character order using the transpose macro.   Easily augmented to swap whole
words as well when word is selected.

## Character Swapping with Transpose

An obscure but often useful (when you get used to it) tool I've encounter in a
few places is the [Transpose tool](http://web.mit.edu/gnu/doc/html/features_7.html#SEC54).
In it's most basic form, it swaps the positions of the character at the current
caret position and the next character in the line.

You can easily add more functionality by detecting a selection using ```ko.view.manager.currentView.scimoz.selectionEmpty```
and transposing whole words instead of characters.

## Installation

To install the macro simply hit the "View Resource" button below, for instructions
on how to install it refer to the [Install Resources Documentation](http://komodoide.com/resources/install-instructions/#pane-macro).

<a href="http://komodoide.com/resources/macros/cgchoffman--transpose/" class="button primary">
    <i class="icon icon-eye"></i>
    View Resource
</a>

## Usage

To use the macro, make an editor selection and then invoke the macro - by
double-clicking on the macro in the toolbox, using the Invoke Tool
(Ctrl+Shift+K) to search/execute "img tag dimensions", or assigning your own
keybinding to the macro.  Click on the link below and have a look at the source
for yourself.
