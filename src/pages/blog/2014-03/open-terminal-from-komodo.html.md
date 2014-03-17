---
title: Open Terminal From Komodo
author: Nathan Rijksen
date: 2014-03-17
tags: [macro, javascript, editor, terminal]
description: Ever wanted to quickly jump from Komodo to your terminal? It's likely a common occurrance, one that twitter user @mjatharvest was facing and decided to tweet us about. Turns out it's pretty easy to add with a macro!
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

<a href="/images/blog/2014-03/openterminal.png" class="lightbox">
    <img src="/images/blog/2014-03/openterminal_thumb.png" align="right"/>
</a>

Ever wanted to quickly jump from Komodo to your terminal? It's likely a common
occurrance, one that [twitter user @mjatharvest was facing][tweet] and decided to tweet
us about. Turns out it's pretty easy to add with a macro!

All I really had to do was inject a menu item into the relevant menupopup,
attach a command to it that launches a terminal in the selected directory and
voila, we've got ourselves a new feature.

```javascript
/**
 * Adds an "Open Terminal Here" menu item to folder items in the Places widget
 *
 * @source https://github.com/Komodo/macros
 * @author Nathan Rijksen
 * @version 0.2
 */

// Register namespace
if ((typeof extensions) == 'undefined') extensions = {};
extensions.OpenTerminalHere = {};

(function()
 {

    // Get places pane document object
    var d = document.getElementById('placesViewbox').contentDocument;

    // Remove existing menu entry if it exists
    var mi = d.getElementById('contextOpenTerminalHere');
    if (mi) mi.parentNode.removeChild(mi);

    // Get the sibling element which we want to insert our menu item after
    var sibling = d.getElementById('placesContextMenu_showInFinder');

    var platform = navigator.platform.toLowerCase();

    // Create our menu item
    mi = document.createElement("menuitem");
    mi.setAttribute("id", "contextOpenTerminalHere");
    mi.setAttribute("hideIf", "file project");
    mi.setAttribute("label", "Open Terminal Here");

    // Add event listener for when the menu item is used
    mi.addEventListener('command', function(e)
    {
        uris = ko.places.viewMgr.getSelectedURIs()
        if ( ! uris.length) return;
        path = uris[0].replace(/^[a-zA-Z]+:\/\//,'');

        // Prepare command for each platform
        var command;
        if (platform.indexOf("mac") != -1) // Mac / OSX -- terminal
            command = 'osascript -e \'tell application "terminal"\' -e \'do script \
                      "cd \\"' + path + '\\""\' -e \'activate\' -e \'end tell\''
        else if (platform.indexOf("linux") != -1) // Linux -- gnome-terminal
            command = 'gnome-terminal --working-directory="' + path + '"'
        else if (platform.indexOf("win") != -1) // Windows -- command prompt
            command = 'cmd /K "cd \"' + path + '\""'

        // Run command, dont show output window
        ko.run.runCommand(window, command, {env: null}, null, null, null, true, 'no-console');
    });

    // Append menu item to popupmenu
    sibling.parentNode.insertBefore(mi, sibling.nextSibling);

}).apply(extensions.OpenTerminalHere);
```

Note I like to be a little verbose with my code, as I like it to be easy to read
and understand. I could likely make this fit into about 10 lines if I'd want to.

## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](/framed/?http://docs.activestate.com/komodo/8.5/toolbox.html).
Once in your toolbox double click the macro to activate it. The macro will
automatically activate itself the next time you start Komodo, you only need to
do this manually the first time.

<div class="inline centered">
<a href="/files/macros/Open_Terminal_Here.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/Open_Terminal_Here.js" target="_blank">View Source</a>
</span>
</div>

## Usage

To use the macro, simply right click a folder in your Places widget (the left
side pane with all the files and folders) and select "Open Terminal Here".

If you would like to use this functionality from a different popupmenu, please feel
free to fork this code and customize it to your liking.

## Going Even Further

My next little side project will be to actually add a terminal into Komodo. I've
been impressed by "[butterfly]" and will likely be injecting that into Komodo and
open up the userscript / userstyle functionality to users once [butterfly] implements
it.

   [tweet]: https://twitter.com/mjatharvest/status/438733525332680705 "View the tweet that lead to this macro"
   [butterfly]: http://paradoxxxzero.github.io/2014/02/28/butterfly.html "butterfly your everyday terminal in your web browser"
