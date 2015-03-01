---
title: Auto Allman-style Braces in Komodo
author: Nathan Rijksen
date: 2014-05-12 6:00
tags: [macro, javascript, editor, auto-complete]
description: Komodo does not dictate any sort of coding style, it merely facilitates you to code whichever way you want. It's easy to code in Allman style, but we can make it even easier with a simple macro.
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Komodo does not dictate any sort of coding style, it merely facilitates you to
code whichever way you want. It's easy to code in [Allman style], but we can make
it even easier with a simple macro.

Essentially what this macro does is turn;

<div class="centered">
    <img src="/assets/images/blog/2014-05/braces-default.gif" style="vertical-align: middle">
    into
    <img src="/assets/images/blog/2014-05/braces-allman.gif" style="vertical-align: middle">
</div>

Typing speed aside in these gifs, the productivity gain here is one less keypress.
It won't make a huge difference but it's the little things that make you more
productive.

In case it's not clear what is happening in those gifs, normally when you would
want to write in allman step you would essentially go through the following steps

```c
while (0)
{
```

The second I type the opening brace Komodo auto completes it to

```c
while (0)
{|}
```

Where "|" represents the cursor. Then when I press enter I get:

```c
while (0)
{
    |
}
```

This works great, but we can make it even shorter (without resorting to snippets),
what if I could just write the following

```c
while (0) {
```

And the second I type the opening brace it auto-completes to Allman style indentation?
That is basically what this macro does.

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

## Credits

Thanks to [@woodpile] from the [Komodo Forums] for [pointing out the use-case] for this
functionality!

   [Allman style]: http://en.wikipedia.org/wiki/Indent_style#Allman_style
   [@woodpile]: http://forum.komodoide.com/users/woodpile/activity
   [Komodo Forums]: http://forum.komodoide.com
   [pointing out the use-case]: http://forum.komodoide.com/t/function-expression-structure/242
