---
title: The History of Komodo, A Trip Down Memory Lane
author: Nathan Rijksen
date: 2099-09-04
tags: [history,features,changelog]
description: The first version of Komodo was released roughly 14 years ago. This means Komodo is older than some of it's users.. and yet it's held up remarkably well. Yes it was starting to show signs of aging, but Komodo 8 came with some age-reversing serum so this dragon isn't going anywhere.
layout: blog
---

<a name="top"></a>

<div class="push-right toc">
    <strong>Jump To: </strong>
    <ul>
        <li>
            <a href="#0.x">Version 0.x - 2000 to 2001</a>
        </li>
        <li>
            <a href="#1.x">Version 1.x - 2001 to 2002</a>
        </li>
        <li>
            <a href="#2.x">Version 2.x - 2002 to 2004</a>
        </li>
        <li>
            <a href="#3.x">Version 3.x - 2004 to 2007</a>
        </li>
        <li>
            <a href="#4.x">Version 4.x - 2007 to 2008</a>
        </li>
        <li>
            <a href="#5.x">Version 5.x - 2008 to 2010</a>
        </li>
        <li>
            <a href="#6.x">Version 6.x - 2010 to 2012</a>
        </li>
        <li>
            <a href="#7.x">Version 7.x - 2012 to 2013</a>
        </li>
        <li>
            <a href="#8.x">Version 8.x - 2013 to Present</a>
            <hr/>
        </li>
        <li>
            <a href="#14ycommits">14 Years of Commits</a>
        </li>
        <li>
            <a href="#back">Looking Back</a>
        </li>
        <li>
            <a href="#forward">Looking Forward</a>
        </li>
    </ul>
</div>

The first version of Komodo was released roughly 14 years ago. This means Komodo
is older than some of it's users.. and yet it's held up remarkably well. Yes
it was starting to show signs of aging, but Komodo 8 came with some age-reversing
serum so this dragon isn't going anywhere.

For a while now I've been wanting to set up some virtual machines and
run through all of the Komodo versions since it's initial launch. Now I finally
got to do just that; and to get the full authentic experience of what Komodo
felt like when each version was released I ran it on the target platform of it's
time, which means I installed Windows 98 - oh the nostalgia.

<hr id="0.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 0.x - 2000 to 2001

Komodo was [first announced on May 24th 2000][1], but the [first version was not released
until (approximately) Nov 9th 2000][2]. Back then Firefox did not even exist yet,
Komodo was based on the Mozilla framework and browser which would later essentially
become Firefox.

The first version looked very bare bones, but that was normal for the software
of that time. What amazed me most about the first version was that it had an Open Files
widget (like we re-introduced in Komodo 8) but it had no file explorer. You
opened files by using your OS file browser or a file open dialog. The file
explorer wasn't introduced until much later.

Some other interesting features in the first version of Komodo were:

 - It came packaged with the Mozilla browser and ChatZilla (!!)
 - You could "collapse" the menubar, but even collapsed it still took up about
   as much space
 - There was no Preference window yet, you could only adjust your preferences
   through the menubar.
 - It already came with Perl and Python debugging
 - It installed to C:\Komodo

<div class="lightbox-group centered" data-title="Komodo Version 0.x - 2000 to 2001">
    <a href="/images/blog/2014-09/screenshots/0.1_files.png" class="lightbox-entry" title="The application files for Komodo 0.1, look at those icons!">
        <img src="/images/blog/2014-09/screenshots/thumb/0.1_files.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/0.2_installer.png" class="lightbox-entry" title="Komodo 0.x Installer">
        <img src="/images/blog/2014-09/screenshots/thumb/0.2_installer.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/0.2_setup_spelling.png" class="lightbox-entry" title="Setting up File Associations">
        <img src="/images/blog/2014-09/screenshots/thumb/0.2_setup_spelling.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/0.2_first_launch.png" class="lightbox-entry" title="First launch, somewhat bugged..">
        <img src="/images/blog/2014-09/screenshots/thumb/0.2_first_launch.png"/>
    </a>
    <br/>
    <a href="/images/blog/2014-09/screenshots/0.2_new_file.png" class="lightbox-entry" title="The supported languages">
        <img src="/images/blog/2014-09/screenshots/thumb/0.2_new_file.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/0.2_tools.png" class="lightbox-entry" title="Mozilla and ChatZilla came packaged">
        <img src="/images/blog/2014-09/screenshots/thumb/0.2_tools.png"/>
    </a>
</div>

<hr id="1.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 1.x - 2001 to 2002

Version 1.x already looked significantly different from 0.x and no longer came
packaged with a browser or chat client. The UI reminded me a lot of earlier
versions of MS Word, not too unsurprising considering it's essentially a text
editor of sorts.

Notable 1.x changes were

 - LOTS of polish over the 0.x version
 - Preferences introduced, already looks a lot like the Preferences dialog we have
   today, though not as populated.
 - Support for FTP servers
 - Introduced the first version of the Rx tookit

<div class="lightbox-group centered" data-title="Komodo Version 1.x - 2001 to 2002">
    <a href="/images/blog/2014-09/screenshots/1.x_installer.png" class="lightbox-entry" title="Installer">
        <img src="/images/blog/2014-09/screenshots/thumb/1.x_installer.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/1.2_start_screen.png" class="lightbox-entry" title="Start Screen">
        <img src="/images/blog/2014-09/screenshots/thumb/1.2_start_screen.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/1.2_prefs_current_file.png" class="lightbox-entry" title="File Properties">
        <img src="/images/blog/2014-09/screenshots/thumb/1.2_prefs_current_file.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/1.2_prefs_fonts_colors.png" class="lightbox-entry" title="Preferences, already had scheme editor">
        <img src="/images/blog/2014-09/screenshots/thumb/1.2_prefs_fonts_colors.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/1.2_prefs_smart_editing.png" class="lightbox-entry" title="More Preferences">
        <img src="/images/blog/2014-09/screenshots/thumb/1.2_prefs_smart_editing.png"/>
    </a>
</div>

<hr id="2.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 2.x - 2002 to 2004

Did you know Komodo had a GUI builder? No? Neither did I until I installed Komodo
2.x. Evidently Komodo used to [support building GUI elements for Tk and Tkinter][4].
This wasn't something slapped on either, the GUI builder was an incredibly
detailed and complete component. So much so that when ActiveState stopped
developing it for various reasons it was open sourced and the community took
charge of it, it was rebranded as SpecTcl and is [still available on SourceForge
today][3].

Other notable 2.x changes included:

 - Linux Version (Version 2.3)
 - Solaris Version (!) (Version 2.5)
 - Color Scheme Editor
 - Introduced the Toolbox (macros, snippets, etc)
 - Source Code Control
 - GUI Builder
 - Visual Package Manager
 - HTML Previewing

<div class="lightbox-group centered" data-title="Komodo Version 2.x - 2002 to 2004">
    <a href="/images/blog/2014-09/screenshots/2.5_install_files.png" class="lightbox-entry" title="Application Files">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_install_files.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_setup_screen.png" class="lightbox-entry" title="The Installer">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_setup_screen.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_start_screen_2.png" class="lightbox-entry" title="Start screen">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_start_screen_2.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_start_screen.png" class="lightbox-entry" title="File Associations">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_start_screen.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_about.png"/>
    </a>
    <br/>
    <a href="/images/blog/2014-09/screenshots/2.5_prefs.png" class="lightbox-entry" title="Preferences">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_prefs.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_gui_builder.png" class="lightbox-entry" title="GUI Builder">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_gui_builder.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/2.5_gui_builder_2.png" class="lightbox-entry" title="GUI Builder in action">
        <img src="/images/blog/2014-09/screenshots/thumb/2.5_gui_builder_2.png"/>
    </a>
</div>

<hr id="3.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 3.x - 2004 to 2007

Komodo 3 really started to look more and more like the Komodo we see today,
the UI and UX started to establish itself more clearly. With Komodo 3 we
introduced one of the most important features in Komodo today - CodeIntel.
This first version required manual input, where you would select which
languages CodeIntel should control on first startup, after which Komodo would
run through the first scan. This is all still being done but is mostly moved
into the background such that you aren't needlessly bothered by it.

Notable 3.x changes included:

 - OSX Version (Komodo 3.5)
 - CodeIntel
 - Interactive Shell (REPL)
 - Code Browser
 - Open / Find Toolbar
 - Custom toolbars, menus and icons

Komodo was more and more becoming the full fledged IDE we know and love today,
but it was still missing a file explorer.

<div class="lightbox-group centered" data-title="Komodo Version 3.x - 2004 to 2006">
    <a href="/images/blog/2014-09/screenshots/3.5_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/3.5_startup.png" class="lightbox-entry" title="First Startup - CodeIntel Prompt">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/3.5_startup_2.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_startup_2.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/3.5_editing.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_editing.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/3.5_codeintel.png" class="lightbox-entry" title="CodeIntel Preferences">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_codeintel.png"/>
    </a>
    <br/>
    <a href="/images/blog/2014-09/screenshots/3.5_codeintel_build.png" class="lightbox-entry" title="CodeIntel Building">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_codeintel_build.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/3.5_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/3.5_about.png"/>
    </a>
</div>

<hr id="4.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 4.x - 2007 to 2008

Finally, we have our File Explorer, or as we tend to call it; "Places". Komodo 4
didn't do much about it's UI, it instead focussed entirely on functionality.

Notable changes were:

 - Go to Definition
 - API Catalogs
 - DOM Viewer Widget
 - Code Browser Widget
 - Vi Emulation
 - HTTP Inspector
 - JS Debugging through a JavaScript DBGP browser extension
 - SFTP and SCP Support
 - SCC Changes List

As you can see whilst 4.x didn't change much visually it added a boatload of
functionality.

<div class="lightbox-group centered" data-title="Komodo Version 4.x - 2007 to 2008">
    <a href="/images/blog/2014-09/screenshots/4.4_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/4.4_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/4.4_startup.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/4.4_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/4.4_editing.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/4.4_editing.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/4.4_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/4.4_about.png"/>
    </a>
</div>

<hr id="5.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 5.x - 2008 to 2010

Komodo 5 received it's first major facelift since 2.x, and was made to look much
nicer on Windows XP.. though you were still stuck with those greens and blues, god
XP was ugly.

Notable changes included:

 - "Modern" (relative) look
 - Code Formatting
 - Ability to launch multiple Komodo windows
 - Editor history (navigate back and forth through your code)
 - Editor Hyperlinking (Ctrl+click)
 - Go to File (Fast Open)
 - Search Highlighting
 - CSS color popup


<div class="lightbox-group centered" data-title="Komodo Version 5.x - 2008 to 2010">
    <a href="/images/blog/2014-09/screenshots/5.2_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/5.2_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/5.0_startup.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/5.0_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/5.0_editor.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/5.0_editor.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/5.0_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/5.0_about.png"/>
    </a>
</div>

<hr id="6.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 6.x - 2010 to 2012

Version 6 polished the new UI introduced in 5.0 a bit, but also introduced
the vertical tabs in the sidebars. I've never been a big fan of those personally
but they were a distinctive part of Komodo for quite a while.

Notable changes included:

 - File Browser Succeeded by "Places"
 - Database Explorer
 - File Publishing (upload to remote servers, eg. FTP)
 - Workspaces
 - Rewrites of several core components

<div class="lightbox-group centered" data-title="Komodo Version 6.x - 2010 to 2012">
    <a href="/images/blog/2014-09/screenshots/6.1_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/6.1_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/6.1_startup.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/6.1_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/6.1_editor.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/6.1_editor.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/6.1_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/6.1_about.png"/>
    </a>
</div>

<hr id="7.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 7.x - 2012 to 2013

Version 7.x made some slight UI changes, notably it integrated parts of the [Aero Theme][5]
created by [Stan Angeloff][6]. It also introduced the ability for IDE users to
sync their preferences to the cloud, such that their preferences would remain the
same between multiple Komodo installs.

Other notable changes included:

 - Variable Highlighting
 - Language Extension - allows users to easily create their own language variations
 - Komodo Profile Sync
 - Code Collaboration
 - Fast Find Widget
 - Movable Widgets
 - Customizable Toolbar

<div class="lightbox-group centered" data-title="Komodo Version 7.x - 2012 to 2013">
    <a href="/images/blog/2014-09/screenshots/7.1_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/7.1_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/7.1_startup.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/7.1_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/7.1_editor.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/7.1_editor.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/7.1_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/7.1_about.png"/>
    </a>
</div>

<hr id="8.x">
<small><a href="#top" class="push-right">Back to Top</a></small>

## Version 8.x - 2013 to Present

Komodo 8 was the first Komodo version I contributed to directly, my main objective
was to modernize the UI as I had always felt that Komodo needed a good looking
UI to match it's powerful feature set. As a result Komodo 8 looks significantly
different from its earlier versions, introducing a completely new monochrome
iconset and skin. The skinning system was built using modern web technologies
and is available for anyone to use.

Other notable changes included:

 - Minimap Scrollbar
 - Customizable panes/widgets
 - Code Refactoring
 - Abyss Skin (dark skin)
 - Breadcrumb Navigation
 - Open Files widget
 - Multiple Cursor Editing
 - Unified Menu Button
 - Custom Skins and Icons

<div class="lightbox-group centered" data-title="Komodo Version 8.x - 2013 to Present">
    <a href="/images/blog/2014-09/screenshots/8.5_setup.png" class="lightbox-entry" title="Setup">
        <img src="/images/blog/2014-09/screenshots/thumb/8.5_setup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/8.5_startup.png" class="lightbox-entry" title="First Startup">
        <img src="/images/blog/2014-09/screenshots/thumb/8.5_startup.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/8.5_editor.png" class="lightbox-entry" title="Editing">
        <img src="/images/blog/2014-09/screenshots/thumb/8.5_editor.png"/>
    </a>
    <a href="/images/blog/2014-09/screenshots/8.5_about.png" class="lightbox-entry" title="About Dialog">
        <img src="/images/blog/2014-09/screenshots/thumb/8.5_about.png"/>
    </a>
</div>

<hr>
<small><a href="#top" class="push-right">Back to Top</a></small>

<a id="14ycommits"></a>
## 14 Years of Commits

Mark Yen, one of the Komodo developers, experimented with [gource][8] a while ago
to get a representation of the work we've done over 14 years. The result isn't
really useful in any way, but it sure is cool to look at.

<div class="centered">
<iframe src="//player.vimeo.com/video/105804003" width="500" height="330" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
</div>

14 years of commits spanning 3 version control systems (perforce, svn and git)
and more committers than I care to count.

<a id="back"></a>
## Looking Back

I've used Komodo for a long time, though I honestly cannot recall what year or
version I started with.. it must have been version 4.x or 5.x. It's funny looking
back through our changelogs and seeing so many vital features being introduced
since the time I started using Komodo; it makes me wonder how on earth I was
able to use Komodo without feature X and Y. But then again, like many programmers
I started out in Notepad (I kid you not) so it's all relative.

As you may have been able to tell I looked at the history of Komodo mainly from
UI and UX perspective, I did not spend a lot of time with individual features.
If you would like to play around with earlier versions of Komodo yourself you
can easily do so by [visiting our Download Archive][7].

<a id="forward"></a>
## Looking Forward

For all the changes Komodo has gone through it is sometimes surprising we still
have stuff to work on; but we do - for all the changes you see on this pages we
have a thousand more in our minds. Komodo 9 will showcase some of the brightest
of those ideas but we've got plenty more for another 14 years, and then some.

   [1]: http://web.archive.org/web/20001009120307/http://www.activestate.com/Corporate/Media_Center/News/Press959150636.html
   [2]: http://web.archive.org/web/20001109160000/http://www.activestate.com/Products/Komodo/index.html
   [3]: http://spectcl.sourceforge.net/
   [4]: http://docs.activestate.com/komodo/3.5/komodo-doc-guibuilder.html
   [5]: http://community.activestate.com/xpi/aero-theme
   [6]: https://twitter.com/StanAngeloff
   [7]: http://downloads.activestate.com/Komodo/releases/archive/
   [8]: https://code.google.com/p/gource/
