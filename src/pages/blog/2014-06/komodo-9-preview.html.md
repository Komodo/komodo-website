---
title: Komodo 9 Preview
author: Todd Whiteman
date: 2014-06-30
tags: [release, nightly, preview]
description: A glimpse of what Komodo IDE 9 will be like.
layout: blog
---

We are giving a preview of what will be inside Komodo IDE 9, and we'll be making
nightly releases here-on-out, to make it easy for users to keep up-to-date.

You can download the lastest Komodo IDE 9 pre-release from here:
http://downloads.activestate.com/Komodo/nightly/komodoide/latest-trunk/

Just remember, this is alpha software - which means it's not thoroughly hardened
and may contain bugs... as such, file any bug reports here:
https://bugs.activestate.com/enter_bug.cgi?product=Komodo&version=9.0.0%20preview

## What's New

### Track Changes

The editor has gained a new left margin - which highlights unsaved changes, as
well as any uncommitted SCC changes.

Clicking on the margin will show a diff dialog of the changes - as well as
letting you revert individual changes! Sweet!

### Python - PEP 8 Syntax Checking

PEP 8 syntax checking has been added - you can enable in the Python Syntax
Checking preferences.

For those that don't know - PEP 8 is the official [Style Guide for Python Code](http://legacy.python.org/dev/peps/pep-0008/).

### Performance Tweaks

We've made a bunch of performance tweaks to Komodo 9 already - with more to
follow. So far we've been concentrating on two main areas:

* **Startup** - we've managed to improve Komodo startup times by around 15%.

* **Editor typing speed** - various editing features have been improved, which
  should be most noticable in larger files, especially HTML/XML.

### Add-on Changes

Some of Komodo's add-ons have been made a core part of Komodo - this means that
the Add-on dialog is a lot less cluttered, and required Komodo Add-ons (here's
looking at you *Places*) can no longer be disabled.

### Language Changes

The number of primary languages has been reduced (as seen in the language menu
in the statusbar), we've moved the less used languages like (XBL, XUL, Luddite)
into the *Other* sub-menu - though your free to adjust these in the Komodo
*Languages* preferences.

Most of the core (UDL based) languages (Add-ons) have been moved into the core
part of Komodo (since disabling them has no performance/memory impact, they
might as well just be hidden).

### Miscellaneous

* **Python 3.4** - now supported for debugging, etc...
* **Copy find results** - which can be used via the toolbar in the find results widget
* **Mozillla 31** - Komodo is now built on top of the Mozilla 31 code base
  

## Information for Add-on developers

There are changes that Komodo Add-on developers should be aware of - we've
been documenting these major changes here:

https://github.com/Komodo/KomodoEdit/wiki/Komodo-9-Changes

## When will Komodo 9 be released?

We've not set a firm deadline - but it will likely around the end of this year.

## What else is coming in Komodo 9?

We've got a lot planned for Komodo 9, here are some teasers of what to expect in
the future builds:

* **Code Intelligence improvements** - JavaScript ES6 (harmony) support, better
  (and faster) code intelligence

* **Commando** - it's our new *Super Fast Open*, quickly access files, improved
  search highlighting, optimal layouts, custom scope searches, ... you can stop
  drooling now.

## What about Komodo Edit?

Komodo Edit builds are not being released yet - they will be included later in
the preview cycle - as we wanted to start with the focus being on Komodo IDE.

