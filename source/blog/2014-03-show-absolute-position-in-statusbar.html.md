---
title: Absolute Cursor Position in Statusbar
author: Carey Hoffman
date: 2014-03-31
tags: [macro, javascript, editor, print, dump, doc, position]
description: Ever wanted to easily see where in the document your current cursor position is relative to the first character?  It's quite easy to override a built-in Komodo function to update your statusbar and show this information.
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

Ever wanted to easily see where in the document your current cursor position is
relative to the first character? [@JustMe](http://forum.komodoide.com/users/justme/activity) was [asking just this on our forums](http://forum.komodoide.com/t/display-current-cursor-position-from-top-of-file/53),
and it turns out it's quite easy to override a built-in Komodo function to update
your statusbar and show this information.

# The Macro

The function that edits the Komodo statusbar to add the byte &amp; char positions

```javascript
function addByteCharPos() {

    var scimoz = ko.views.manager.currentView.scimoz;  // Get scintilla

    var bytePos = scimoz.currentPos;  // Get byte pos of cursor
    var charPos = scimoz.charPosAtPosition(bytePos);  // Get char pos of cursor

    // Get the statusbar line and column section to append new stats
    var lineColWidget = document.getElementById('statusbar-line-col');

    // If these mis-match then there are mutliple byte chars in the doc.
    // Give the char position rather than the byte/absolute position.
    if (bytePos == charPos) {
        var lineColText = lineColWidget.getAttribute("label") +
                        " Byte: " + bytePos;
    } else {
        var lineColText = lineColWidget.getAttribute("label") +
                        " Char: " + charPos;
    }
    // Attach new string
    lineColWidget.setAttribute('label', lineColText);
}
```

Create a namespace to save your function and ensure it's not triggered too early

```javascript
if (typeof(extensions) == "undefined") {
    extensions = {};
}

extensions.addByteCharPos = function(){
    setTimeout(addByteCharPos, 1);
};
```

There just happens to be an event ready for us to use, [current_view_linecol_changed](https://github.com/Komodo/KomodoEdit/blob/371adfcc44db5e63dc50b9059cd1c5eec289e6fa/src/chrome/komodo/content/statusbar.p.js#L648)

```javascript
// Make sure you don't add it twice so remove
window.removeEventListener('current_view_linecol_changed', extensions.addByteCharPos, false);
window.addEventListener('current_view_linecol_changed',extensions.addByteCharPos, false);
```

See the completed macro with comments on github: [add_byte_char_pos_statusbar.js](https://github.com/Komodo/macros/blob/master/add_byte_char_pos_statusbar.js)

## Installation

To install the macro simply hit the download button below, then drag the downloaded
file into your [Komodo toolbox](http://docs.activestate.com/komodo/latest/toolbox.html).
Once in your toolbox double click the macro to activate it. The macro will
automatically activate itself the next time you start Komodo, you only need to
do this manually the first time.

<div class="inline centered">
<a href="/files/macros/Add-byte-char-pos-statusbar.komodotool" class="button primary">
    <i class="icon icon-download"></i>
    Download Macro
</a>
<div class="spacer-half"></div>
<span>
    <i class="icon icon-github"></i>
    <a href="https://github.com/Komodo/macros/blob/master/add_byte_char_pos_statusbar.js" target="_blank">View Source</a>
</span>
</div>
