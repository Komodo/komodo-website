---
title: Komodo 9 RC Now Available!
author: Todd Whiteman
date: 2015-02-20
tags: [release, beta, nightly, preview]
description: Komodo 9 is nearing final release - so please try out the new features and help the team by reporting bugs or enhancement ideas.
layout: blog
---

We've completed the big feature work for Komodo IDE 9, and we'll focus on bug
fixes and polishing for the final release, so please help us out by giving
Komodo 9 release candidate a try and report any issues you run into.

We'll continue making nightly releases from here on out, to make it easy for
Komodo 9 pre-release users to keep up to date.

You can [download the latest Komodo IDE 9 pre-release from our Download section](/download#preview).

<div class="centered">
    <div class="spacer"></div>
    <a href="/download#preview" class="button big primary">
        <i class="icon icon-download"></i>
        Download Komodo 9 Preview
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-bug"></i>
        <a href="https://bugs.activestate.com/enter_bug.cgi?product=Komodo&version=9.0.0%20preview" target="_blank">Report a Bug</a>
    </span>
</div>

Just remember, this is pre-release software - which means it's not thoroughly
hardened and will contain bugs... as such, please report any problems you run
into on our [bug tracker](https://bugs.activestate.com/enter_bug.cgi?product=Komodo&version=9.0.0%20preview).

## What's New

Here is a list of the major features and product changes made in Komodo 9 (you
can click on the images to enlarge them):


### Color Schemes and Themes

<a href="/images/blog/2015-02/tomorrow-dark-color-scheme.png" class="lightbox" title="Tomorrow Dark scheme - click to enlarge">
<img src="/images/blog/2015-02/tomorrow-dark-color-scheme-thumb.png" align="right">
</a>

We've tweaked the Komodo color schemes and we've made *Tomorrow_Dark* the new
default Komodo color scheme (a dark-based scheme). All Komodo color schemes now
use Base16, that is, they are based on a set of 16 different base colors, which
are then re-used in different parts of that scheme.

The Komodo theming has been updated to match the latest operating systems, so
Komodo now looks even better - more akin to other native applications of the OS.

We also added the ability to tweak the editor line height spacing, which is now
saved in the color scheme preferences page.


### Track Changes

<a href="/images/blog/2014-12/trackchanges.png" class="lightbox" title="Track Changes mockup - click to enlarge">
<img src="/images/blog/2014-12/trackchanges-thumb.png" align="right">
</a>

The editor has gained a new left margin - which highlights unsaved changes, as
well as any uncommitted SCC changes. Clicking on the margin will show a diff
dialog of the changes - as well as letting you revert individual changes! Sweet!

<div class="clearfix"></div>


### Markdown Viewer

<a href="/images/blog/2014-12/markdown-viewer.png" class="lightbox" title="Markdown viewer - click to enlarge screenshot">
<img src="/images/blog/2014-12/markdown-viewer-thumb.png" align="right">
</a>

For Markdown files, Komodo provides a preview of the generated HTML directly
within a Komodo split view and contents will dynamically update itself whenever
you make a change to the Markdown text - it doesn't even need to be saved. You
can check out the [markdown blog post] for more details on this feature.

<div class="clearfix"></div>


### Go Programming Language Support

<img src="http://komodoide.com/images/blog/2014-10/golang-logo.png" align="right">

Golang is supported in Komodo. We provide syntax coloring, code folding, syntax
checking (linting) and code intelligence with completions, calltips, outline and
goto definition for .go files. Please check out the [golang blog post] for more
details on this support.

<div class="clearfix"></div>


### Commando

<a href="/images/blog/2014-12/commando.png" class="lightbox" title="Commando - click to enlarge screenshot">
<img src="/images/blog/2014-12/commando-thumb.png" align="right">
</a>

This popup dialog is the combined successor of the *Fast Open* and *Invoke Tool*
dialogs in Komodo 8. Commando provides fuzzy matching, match highlighting,
search for files (find any file under a folder), toolbox search, bookmark
integration, shortcuts (go-tool) integration as well as custom category
filtering.

<div class="clearfix"></div>


### <a href="http://kopy.io/">Kopy.io</a> Helper

<a href="http://kopy.io/">
<img src="http://kopy.io/img/pastebin-logo-dark.png" align="right">
</a>

Now you can easily share (like pastebin) snippets of code with other people
directly from Komodo. Simple make a text selection and use the editor
right-click context menu and choose *Share Code via Kopy.io*. Even better is that
Kopy.io supports client side encryption, so you can make those shared pastes
more secure.

<div class="clearfix"></div>


### Notifications UI

<a href="/images/blog/2014-12/notify.png" class="lightbox" title="Notifications UI - click to enlarge screenshot">
<img src="/images/blog/2014-12/notify-thumb.png" align="right">
</a>

Notification messages shown to the user now appear in a separate popup panel
that overlays the main Komodo editor window (previously they appeared in the
Komodo statusbar). Komodo also has notification preferences, allowing you to
control which messages get displayed in the popup panel.

<div class="clearfix"></div>


### Icons

Most of the icons in Komodo user interface have been updated to use improved
images or to use a consistent style. We've tweaked the file icons, language
icons, places icons, toolbox icons, preference page icons and code intelligence
icons (completions, sections list, code browser).

<div class="clearfix"></div>


### Menu Bar

The Komodo main menu bar (i.e. the File, Edit, ...) is now hidden by default on
Windows and Linux. You can use the Alt key to toggle the menu visibility, or
force it be always displayed through the *View > Toolbars* menu.

Whilst the top-level menu is hidden, a unified menu button will be visible in
the top-right of the Komodo toolbar, or if the toolbar is also hidden, then it
will appear in the Komodo view status bar.


### PHP 5.6 Support

We've added support for PHP 5.6, with a new Xdebug module (for PHP debugging and
Code Profiling), updates for keyword changes and updates to code intelligence to
provide the latest API data for PHP 5.6.


### Python Updates

Python 3.4 is fully supported for syntax checking, debugging, code intelligence,
etc...

We've added PEP 8 syntax checking - you can enable this in the Python Syntax
Checking preferences. For those that don't know - PEP 8 is the official [Style
Guide for Python Code](http://legacy.python.org/dev/peps/pep-0008/).


### Komodo Developer APIs

We've been overhauling the Komodo APIs, to make it easier to load and access the
methods inside of Komodo. We're now making use of CommonJS (aka Node.js)
require() calls to load individual modules - you can see the full list of
supported modules in the Komodo [sdk directory]. Examples of use and more
information can be found in the [Komodo wiki].

We've also added convenient console.log() and friends support - the messages
show up in the Komodo notifications pane.

There are other changes that Komodo Add-on developers should be aware of - we've
been documenting these major changes on our [Komodo wiki] page.

### Performance Tweaks

We've made a bunch of performance tweaks to Komodo 9 already - with more to
follow. So far we've been concentrating on two main areas:

* *Startup* - we've managed to improve Komodo startup times by around 15%.

* *Editor typing speed* - various editing features have been improved, which
  should be most noticeable in larger files, especially HTML/XML.

* *Search* - improved performance of find next/previous calls

* *Syntax Checking* - Faster syntax checking times

### Miscellaneous

* *Indentation detection* - better tab v's spaces indentation detection
* *Statusbar moved* - it's now attached to the bottom of the editor view (and
  not to the bottom of the window)
* *CSS code formatter* - so you can now eaily reformat your CSS code
* *Preferences page* - now has *simple* and *advanced* modes
* *Startpage* - now removed - a Quick Launch page is now displayed when no views are opened
* *Custom workspaces* - can be saved and loaded on demand, use the File > Workspace menu
* *High DPI* - should work correctly on Windows - no blurred fonts
* *Tab width* - the indentation preference has changed from 8 spaces to 4 spaces
* *Commit dialog* - now displays the current branch name
* *Menus* - various menus were re-organised, including tab and editor context menus
* *Sections list* - has merged with breadcrumbs widget
* *Copy find results* - which can be used via the toolbar in the find results widget
* *File associations* - you can now set file associations for unknown languages
  hit in the replace in files confirmation dialog
* *Primary language cleanup* - less used languages like (XBL, XUL, Luddite) no
  longer appear in the main menu - though your free to adjust these in the
  Komodo *Languages* preferences.
* *Komodo Sync* - has been removed for Komodo 9
* *Mozilla 35* - Komodo is now built on top of the Mozilla 35 code base
* *Analytics* - We now analyze how our users use Komodo to help us improve our
  product. This is entirely optional and we do not track user specific
  information. You can [view our Analytics code on
  github](https://github.com/Komodo/KomodoEdit/blob/master/src/modules/analytics/content/analytics.js).

## Questions?

**Q:** When will Komodo 9 be released?<br>
**A:** We've not set a firm deadline - but it will likely be in the next few months.

**Q:** What else is coming in Komodo 9?<br>
**A:** This is most of the big feature plans we have for Komodo 9, we've got a
few other things planned, but mostly the focus will be on bug fixes and polish
until Komodo 9 final is released. We'll have more features coming soon in a
follow-up Komodo 9.1 release.

**Q:** I have more questions!<br>
**A:** [Talk to us directly on the forums!](http://forum.komodoide.com/)


[markdown blog post]: http://komodoide.com/blog/2014-11/live-markdown-viewing-in-komodo/
[golang blog post]: http://komodoide.com/blog/2014-10/introducing-go-lang-support/
[sdk directory]: https://github.com/Komodo/KomodoEdit/tree/master/src/chrome/komodo/content/sdk
[Komodo wiki]: https://github.com/Komodo/KomodoEdit/wiki/Komodo-9-Changes
