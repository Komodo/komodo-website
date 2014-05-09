---
title: Auto Allman-style Braces in Komodo
author: Nathan Rijksen
date: 2014-05-12 12:00
tags: [macro, javascript, editor, auto-complete]
description: Komodo does not dictate any sort of coding style, it merely facilitates you to code whichever way you want. It's easy to code in Allman style, but we can make it even easier with a simple macro.
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Komodo does not dictate any sort of coding style, it merely facilitates you to
code whichever way you want. It's easy to code in [Allman style], but we can make
it even easier with a simple macro.

Essentially what this macro does is turn;

<div class="centered">
    <img src="/images/blog/2014-05/braces-default.gif" style="vertical-align: middle">
    into
    <img src="/images/blog/2014-05/braces-allman.gif" style="vertical-align: middle">
</div>

Typing speed aside in these gifs, the productivity gain here is one less keypress.
It won't make a huge difference but it's the little things that make you more
productive.

Currently this macro is still very experimental and will likely have a few bugs
that need to be worked out. Hopefully we'll be able to include it as a native
feature in Komodo 9.

## Installation

To install the macro simply hit the "View Resource" and "Install Instructions"
links below. You'll want to hook the macro up to the "On Startup" trigger.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/macros/naatan--autoallmanbraces/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-macro" target="_blank">Install Instructions</a>
    </span>
</div>

## Usage

Simply start typing! Provided that you have triggered the macro (either via the
startup event or by manually invoking it) it will automatically complete your
curly braces to [Allman style].

   [Allman style]: http://en.wikipedia.org/wiki/Indent_style#Allman_style
