---
title: Komodo 8 Changelog
layout: markdown
sidebar: download
classNames: small-text markdown
---

# Komodo IDE/Edit 8.5 Release Notes

These Release Notes cover [what's new](#whatsnew), [detailed changes and bug fixes](#details) and [known issues](#knownissues) for Komodo IDE and Komodo Edit.

## <a name="whatsnew">What's New in Komodo IDE/Edit</a>

### 8.5

*   **Code Refactoring**: The new Komodo refactoring component
        has these smart code-transformation capabilities:

    *   **Rename Variable**: quickly and easily rename
          variables in the editor. It uses inline markers and multiple cursor
          selections to easily change the name of a code variable.
    *   **Rename Class Member**: similar to rename variable,
          but works on all instances and across multiple files.
    *   **Method Extraction**: move parts of your code into a
          new function. Any variables used in the selected text are refactored
          into function arguments and are then passed to the extracted
          method.
        Note that code refactoring will only work with languages that provide
        code intelligence information (i.e. PHP, Perl, Python, Ruby, JavaScript,
        Node.js).
*   **Abyss theme**: A new dark theme for the Komodo user
        interface has been added. This theme affects the Komodo UI elements
        outside of the main editor (i.e. different from Komodo color schemes
        which only affect the main editor colors). You can enable Abyss in the
        Komodo _Appearance_ preferences.

*   **PHP 5.5 Support**: We've added support for PHP 5.5, with
        a new Xdebug module (for PHP debugging and Code Profiling), updates for
        the two new keywords (yield, finally) and updates to code intelligence
        to provide the latest API data for PHP 5.5.

*   **Breadcrumbs**: A file and directory navigation bar has
        been added to the Komodo statusbar. This bar shows the directory
        ancestors relative to the current editor file, allowing you to easily
        find and open related files. You can use mouse and/or keyboard to
        navigate entries and filter down the list of files displayed.

*   **Multiple Selections**: In addition to Komodo's
        rectangular (column) editing, you can now have multiple caret positions
        in the editor. Typing or editing commands will be reflected at all caret
        locations. Use the editor's right-click context menu and click on
        '_Select &gt; Multiple Selection - Add_'. Then you can use
        Ctrl+Click (Cmd+Click on the Mac) to place additional carets and
        selections.

*   **Button Menu**: Komodo can now be configured to use a
        collapsed toolbar button menu, instead of a full menu bar (does not
        apply to Mac OS X). This can be useful when you want to maximize your
        vertical editing space. A bonus of this feature is that the last used
        menu items will also be displayed in the top-level of the button menu,
        making it quick and easy to run the same menu command again.

*   **Python Symbols**: Due to popular demand, we've now added
        two-character length triggering for Python symbols. For example, when
        you type "im" you'll now see completions for "import" as well as any
        local variables, functions, classes and builtins that are in scope and
        have a name starting with "im".

*   **Code Intelligence Out-Of-Process**: Komodo's code
        intelligence system (code scanning, calltips, completions, goto
        definition, refactoring, etc...) is now handled by an external process.
        Mostly you won't notice any changes in functionality, but this does boost
        Komodo's responsiveness whilst editing.

*   **Mac Improvements**: Drawing is smoother and Komodo can
        draw using the integrated graphics card. There were some edge cases on
        Retina screens where drawing glitches could occur in the editor
        component, leaving unwanted artefacts - this has now been fixed. Komodo
        can now work with the integrated graphics card - which can lead to
        improved battery life on laptops.

*   **Performance**: Various performance tweaks were made to
        Komodo 8.5 to improve the editing performance, as well as improving the
        search speed, syntax checking times and general responsiveness of
        Komodo.

*   **Other Mentionables**

    *   Side pane scrollbars now fade out when they are not in use
    *   Open Files now includes additional sorting and grouping options
    *   Font Quality (anti-aliasing) preferences were added (Windows and Mac OS X)
    *   Komodo now updated to use the Mozilla 24, Scintilla 3.34 and Python 2.7.5

## <a name="details">Detailed Changes and Bug Fixes in Komodo IDE/Edit</a>

Changes related to Debugging, Interactive Shells, Source Code
Control, HTTP Inspector, Rx Toolkit, Code Browser, Database Explorer,
Stackato and the Sections List only apply to Komodo IDE only.

### 8.5.4 Bug Fixes

*    Code Intelligence: CSS: Show pseudo completions after ":".
*    Code Intelligence: PHP: Fix memory leak in PHP file scanning. (Bug [102643](http://bugs.activestate.com/show_bug.cgi?id=102643))
*    Code Intelligence: JavaScript: Ensure document completions work inside of HTML. (Bug [102993](http://bugs.activestate.com/show_bug.cgi?id=102993))
*    Debugging: Python 3: Update log-level matching code to work on Python 3.4. (Bug [103631](http://bugs.activestate.com/show_bug.cgi?id=103631))
*    Debugging: Tcl: Update appLaunch.tcl file. (Bug [101199](http://bugs.activestate.com/show_bug.cgi?id=101199))
*    Editor: Automatically enable word-wrap when a file has long lines. (Bug [93790](http://bugs.activestate.com/show_bug.cgi?id=93790))
*    Editor: Django: Highlight 'elif' tag, 'elseif' in Twig (and improve auto-indent). (Bug [101792](http://bugs.activestate.com/show_bug.cgi?id=101792))
*    Editor: Fix high DPI popup positioning on Windows. (Bug [100492](http://bugs.activestate.com/show_bug.cgi?id=100492))
*    Editor: When changing case in column selection, stay in column selection. (Bug [100269](http://bugs.activestate.com/show_bug.cgi?id=100269))
*    Find: Ensure find markers are not added more than once. (Bug [104553](http://bugs.activestate.com/show_bug.cgi?id=104553))
*    Find: Stop find options from changing when using multi caret commands. (Bug [103329](http://bugs.activestate.com/show_bug.cgi?id=103329))
*    Places: After creating a new file, open it and display it in places. (Bug [94287](http://bugs.activestate.com/show_bug.cgi?id=94287))
*    Places: Cull deleted items in places history menu. (Bug [98684](http://bugs.activestate.com/show_bug.cgi?id=98684))
*    Preferences: Indentation Settings: Allow per language settings to be saved. (Bug [99431](http://bugs.activestate.com/show_bug.cgi?id=99431))
*    Projects: When opening a new project is aborted, keep the old project on the MRU list. (Bug [94201](http://bugs.activestate.com/show_bug.cgi?id=94201))
*    SDK: Ensure koext startlang works with --is-html-based argument (Bug [104551](http://bugs.activestate.com/show_bug.cgi?id=104551)).
*    Source Code Control: Checkout: Remember the checkout textbox url. (Bug [99395](http://bugs.activestate.com/show_bug.cgi?id=99395))
*    Source Code Control: Git: Ensure git submodules are properly detected in commit dialog. (Bug [95701](http://bugs.activestate.com/show_bug.cgi?id=95701))
*    Syntax Checking: Python: Reinstate passing --rcfile to pylint, and add tests to verify it works. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*    Syntax Checking: Python: Tell pylint where to find .pylintrc. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*    Toolbox: Stop duplication of snippets when dropping snippet text. (Bug [103113](http://bugs.activestate.com/show_bug.cgi?id=103113))
*    UI: Re-enable word-wrap in output panels (command output, debugger output). (Bug [98471](http://bugs.activestate.com/show_bug.cgi?id=98471))

### 8.5.3 Bug Fixes

*   Code Intelligence: Fix case where codeintel startup could fail due to race condition. (Bug [101543](http://bugs.activestate.com/show_bug.cgi?id=101543))
*   Code Intelligence: Performance: Avoid rescanning dependent files on modification. (Bug [101312](http://bugs.activestate.com/show_bug.cgi?id=101312))
*   Code Intelligence: PHP: Allow goto definition on foreach variables. (Bug [100701](http://bugs.activestate.com/show_bug.cgi?id=100701))
*   Code Intelligence: Python: Ensure code scanning supports the "yield from" syntax. (Bug [101404](http://bugs.activestate.com/show_bug.cgi?id=101404))
*   Code Intelligence: Sections List: Ensure HTML/XML section lists are updated after editor modifications. (Bug [101442](http://bugs.activestate.com/show_bug.cgi?id=101442))
*   Code Intelligence: Sections List: Sometimes the list would not show due to a recursion error. (Bug [101280](http://bugs.activestate.com/show_bug.cgi?id=101280))
*   Crash Reports: Re-enable the crash report dialog. (Bug [101006](http://bugs.activestate.com/show_bug.cgi?id=101006))
*   Debugger: Make sure we can debug Python3 programs that contain non-ascii data in strings (and comments). (Bug [101268](http://bugs.activestate.com/show_bug.cgi?id=101268))
*   Debugger: PHP: Update Xdebug to version 2.2.3. (Bug [101265](http://bugs.activestate.com/show_bug.cgi?id=101265))
*   Debugger: Tcl: Include a Tcl debug engine for Win64, and choose it at runtime when the tclsh.exe or wish.exe interpreter is 64-bit. (Bug [101199](http://bugs.activestate.com/show_bug.cgi?id=101199))
*   Debugger: When starting a remote-debugging session, make sure the pref for stopping at the first breakpoint is respected. (Bug [100884](http://bugs.activestate.com/show_bug.cgi?id=100884))
*   Editor: Ensure caret is scrolled into view when opening files and jumping to definitions. (Bug [98866](http://bugs.activestate.com/show_bug.cgi?id=98866))
*   Editor: Make sure cmd_addNextWordToCaretSet (default binding: Ctrl-D) works in presence of high-bit chars in the document. (Bug [100931](http://bugs.activestate.com/show_bug.cgi?id=100931))
*   Editor: Minimap: Don't change the first line in the screen when tabbing/shift-tabbing a block with the minimap visible. (Bug [101318](http://bugs.activestate.com/show_bug.cgi?id=101318))
*   Editor: Minimap: Improve editor scroll handling and scrolling performance when minimap is enabled. (Bug [100956](http://bugs.activestate.com/show_bug.cgi?id=100956))
*   Editor: Performance: Speed up UDL processing for files with very long lines (includes PHP, XML, HTML, Django, etc). (Bug [101267](http://bugs.activestate.com/show_bug.cgi?id=101267))
*   Editor: Prefs: Increase the file size limits that control switching to a plain-text language. (Bug [101629](http://bugs.activestate.com/show_bug.cgi?id=101629))
*   Editor: Prevent repeatedly pressing Ctrl-D (Add next word to multiple selection) from crashing Komodo. (Bug [100955](http://bugs.activestate.com/show_bug.cgi?id=100955))
*   History: Make sure history db corruptions do not cause startup failures. (Bug [101551](http://bugs.activestate.com/show_bug.cgi?id=101551))
*   Hyperlinks: Ensure the PHP include handler works over the full include statement. (Bug [101505](http://bugs.activestate.com/show_bug.cgi?id=101505))
*   Languages: Support C++11 keywords. (Bug [101299](http://bugs.activestate.com/show_bug.cgi?id=101299))
*   Linux: Editor: Allow rectangular paste on Linux. (Bug [82591](http://bugs.activestate.com/show_bug.cgi?id=82591))
*   Mac: Disable the scroll width preference, as it can mess up the editor display. (Bug [88586](http://bugs.activestate.com/show_bug.cgi?id=88586))
*   Mac: Editor: Focus the editor when mouse clicking on the line number margin. (Bug [101290](http://bugs.activestate.com/show_bug.cgi?id=101290))
*   Mac: Editor: Make sure text is pasted into every selection when a multiple-selection/caret session is in effect. (Bug [101220](http://bugs.activestate.com/show_bug.cgi?id=101220))
*   Macros: Make sure macro and snippet contents are always up to date when editing them in the editor. (Bug [101263](http://bugs.activestate.com/show_bug.cgi?id=101263))
*   Macros: Show accurate macro line numbers for syntax errors and runtime errors when executing macros. (Bug [95519](http://bugs.activestate.com/show_bug.cgi?id=95519))
*   Preferences: Make sure project internationalization settings are correctly saved to project prefs. (Bug [101174](http://bugs.activestate.com/show_bug.cgi?id=101174))
*   Refactoring: Make sure undo (and other operations that end multi-caret editing sessions) don't corrupt the undo-stack. (Bug [100837](http://bugs.activestate.com/show_bug.cgi?id=100837))
*   Rx Toolkit: Don't throw an exception on startup when the regex field is empty. (Bug [100694](http://bugs.activestate.com/show_bug.cgi?id=100694))
*   Rx Toolkit: Clear errors when switching between different regex languages. (Bug [97340](http://bugs.activestate.com/show_bug.cgi?id=97340))
*   Source Code Control: The Git push dialog no longer gets stuck at the end of a push. (Bug [99920](http://bugs.activestate.com/show_bug.cgi?id=99920))
*   Syntax Checking: Make sure files are linted when they are first opened. (Bug [101552](http://bugs.activestate.com/show_bug.cgi?id=101552))
*   Syntax Checking: PyLint: Support pylint 1.0, which stopped supporting the -i argument. (Bug [100028](http://bugs.activestate.com/show_bug.cgi?id=100028))
*   Syntax Checking: PyLint: Support pylint for Python3 code. (Bug [96733](http://bugs.activestate.com/show_bug.cgi?id=96733))
*   Syntax Checking: RHTML: Wrap &lt;%= ... %&gt; constructs with 'Proc.new {' ... '}.call;' to avoid bugus syntax errors. (Bug [100835](http://bugs.activestate.com/show_bug.cgi?id=100835))
*   UI: Added a Getting Started dialog to Komodo that helps new users get the basics of Komodo. (Bug [98250](http://bugs.activestate.com/show_bug.cgi?id=98250))
*   UI: Button text in the toolbar will now properly show when using a hidpi (cupertino) icon set. (Bug [100933](http://bugs.activestate.com/show_bug.cgi?id=100933))
*   UI: Icons: Checkboxes and radio boxes were sometimes not showing in menu's under Abyss.
*   UI: Moved trial message out of statusbar and into notification, so that its not blocking breadcrumbs. (Bug [100548](http://bugs.activestate.com/show_bug.cgi?id=100548))
*   Windows: Support high DPI on Windows, for editor right-clicking and context menus. (Bug [100492](http://bugs.activestate.com/show_bug.cgi?id=100492))

### 8.5.2 Bug Fixes

*   Code Intelligence: Reduce memory usage by properly clearing requests and working variables. (Bug [100994](http://bugs.activestate.com/show_bug.cgi?id=100994))
*   Editor: When saving, fix the "Strip trailing whitespace" preference from removing lines. (Bug [100967](http://bugs.activestate.com/show_bug.cgi?id=100967))

### 8.5.1 Bug Fixes

*   Code Browser: Fix case where code browser can stop working when editing HTML code.
*   Code Intelligence: JavasSript: Add rudimentary support for ES6 fat arrow functions. (Bug [100070](http://bugs.activestate.com/show_bug.cgi?id=100070))
*   Code Intelligence: Python: Include 2 character keywords in the local symbols completion list. (Bug [100471](http://bugs.activestate.com/show_bug.cgi?id=100471))
*   Code Intelligence: Tcl: Ensure completions get inserted on Tab keypress. (Bug [100332](http://bugs.activestate.com/show_bug.cgi?id=100332))
*   Colour Picker: Added keybinding to launch colour picker without an existing hex colour. (Bug [99413](http://bugs.activestate.com/show_bug.cgi?id=99413))
*   Debugging: Python: Prevent debugger crash when debugging numpy. (Bug [100540](http://bugs.activestate.com/show_bug.cgi?id=100540))
*   Editor: Don't throw an exception on null views when closing all buffers. (Bug [100508](http://bugs.activestate.com/show_bug.cgi?id=100508))
*   Editor: Ensure saveAs works when linting is disabled. (Bug [100476](http://bugs.activestate.com/show_bug.cgi?id=100476))
*   Editor: On close, if an untitled buffer failed to save then leave the buffer open. (Bug [100455](http://bugs.activestate.com/show_bug.cgi?id=100455))
*   Editor: Speed up editor scrolling. (Bug [100536](http://bugs.activestate.com/show_bug.cgi?id=100536))
*   Editor: Stop a breakpoint click from also performing code folding. (Bug [100390](http://bugs.activestate.com/show_bug.cgi?id=100390))
*   File Associations: Associate ".inl" file extension to the C++ language. (Bug [99525](http://bugs.activestate.com/show_bug.cgi?id=99525))
*   Mac: Allow hyperlinks to work after the editor is scrolled. (Bug [100487](http://bugs.activestate.com/show_bug.cgi?id=100487))
*   Mac: Ensure python is installed correctly for out-of-process codeintel. (Bug [98931](http://bugs.activestate.com/show_bug.cgi?id=98931))
*   Mac: Ensure retina icons are enabled. (Bug [100549](http://bugs.activestate.com/show_bug.cgi?id=100549))
*   Mac: Fix variable highlight coloring after scrolling. (Bug [100361](http://bugs.activestate.com/show_bug.cgi?id=100361))
*   Mac: Stop high CPU usage when idle. (Bug [100457](http://bugs.activestate.com/show_bug.cgi?id=100457))
*   Find: Stop editor background color from leaking into the find bar. (Bug [100441](http://bugs.activestate.com/show_bug.cgi?id=100441))
*   Places: Support copying folders. (Bug [100160](http://bugs.activestate.com/show_bug.cgi?id=100160))
*   Refactoring: Rename Variable: Don't give up when an occurrence of the current variable occurs inside a comment or default text. Accept it, and carry on. (Bug [100499](http://bugs.activestate.com/show_bug.cgi?id=100499))
*   Remote Files: Stop delay when switching between remote file editor tabs. (Bug [100525](http://bugs.activestate.com/show_bug.cgi?id=100525))
*   Spellcheck: Make sure the spellchecker correctly replaces with the suggested text. (Bug [100612](http://bugs.activestate.com/show_bug.cgi?id=100612))
*   Startup: If no buffers are loaded, stop history from trying to log the current buffer. (Bug [100501](http://bugs.activestate.com/show_bug.cgi?id=100501))
*   Syntax Checking: JSLint: Get jslint and jshint working again by allowing for the scriptArgs. (Bug [100530](http://bugs.activestate.com/show_bug.cgi?id=100530))
*   Unit Testing: Support creating unittests for Python3. (Bug [98705](http://bugs.activestate.com/show_bug.cgi?id=98705))

### 8.5.0 Bug Fixes

*   Collaboration: Allow ko.collaboration.shareCurrentTabInNewSession. (Bug [95867](http://bugs.activestate.com/show_bug.cgi?id=95867))
*   Editor: Add a pref to control whether tab skips over soft characters. (Bug [95685](http://bugs.activestate.com/show_bug.cgi?id=95685))
*   Editor: After pressing tab, update the caretX setting. (Bug [95409](http://bugs.activestate.com/show_bug.cgi?id=95409))
*   Editor: Ensure "Save as" properly maintains the language name. (Bug [100142](http://bugs.activestate.com/show_bug.cgi?id=100142))
*   Editor: Implement select current/next word in multi-caret sessions. (Bug [99924](http://bugs.activestate.com/show_bug.cgi?id=99924))
*   Editor: Mac: Allow scrolling with magic mouse and trackpad. (Bug [99862](http://bugs.activestate.com/show_bug.cgi?id=99862))
*   Editor: Mac: Ensure mouse actions use the correct editor co-ordinates. (Bug [100140](http://bugs.activestate.com/show_bug.cgi?id=100140))
*   Editor: Mac: Fix drawing glitch in the editor. (Bug [99863](http://bugs.activestate.com/show_bug.cgi?id=99863))
*   Editor: Mac: Stop editor glitches when resizing the editor view. (Bug [99863](http://bugs.activestate.com/show_bug.cgi?id=99863))
*   Editor: Mac: Stop white flashes when using a dark background. (Bug [100251](http://bugs.activestate.com/show_bug.cgi?id=100251))
*   Editor: Show matching tag when clicking between "&lt;" and "/" in an end-tag. (Bug [96641](http://bugs.activestate.com/show_bug.cgi?id=96641))
*   Editor: When ESC (or cmd_cancel) is pressed, turn off adjacent soft characters. (Bug [100228](http://bugs.activestate.com/show_bug.cgi?id=100228))
*   Editor: When dragging text, remove the large opaque drag image. (Bug [100041](http://bugs.activestate.com/show_bug.cgi?id=100041))
*   Interpolation Shortcuts: Get %node interpolation working. (Bug [98915](http://bugs.activestate.com/show_bug.cgi?id=98915))
*   Preferences: Persist word wrap setting on a per document basis. (Bug [100275](http://bugs.activestate.com/show_bug.cgi?id=100275))
*   Syntax Checking: At startup verify that klint is ready to fill in the syntax checking status pane. (Bug [100198](http://bugs.activestate.com/show_bug.cgi?id=100198))
*   Syntax Checking: After switching to a language without linting, clear the syntax checking status panel. (Bug [97951](http://bugs.activestate.com/show_bug.cgi?id=97951))

### 8.5.0b3 Bug Fixes

*   Bug 100000, Yay!? (Bug [100000](http://bugs.activestate.com/show_bug.cgi?id=100000#c7))
*   Breadcrumbs: Move into the statusbar so that they don't use up any additional screen real estate.
*   Code Intelligence: Catalogs: Don't force a catalog zone update when setting catalog dirs. (Bug [99807](http://bugs.activestate.com/show_bug.cgi?id=99807))
*   Code Intelligence: Improve performing of directory scanning. (Bug [100077](http://bugs.activestate.com/show_bug.cgi?id=100077))
*   Code Intelligence: Python: Ensure calltip for @staticmethod functions is correct. (Bug [86260](http://bugs.activestate.com/show_bug.cgi?id=86260))
*   Code Intelligence: Python: Offer completions for local symbols (variables, classes, ...). (Bug [59937](http://bugs.activestate.com/show_bug.cgi?id=59937))
*   Code Intelligence: Python3: Process function annotations. (Bug [99671](http://bugs.activestate.com/show_bug.cgi?id=99671))
*   Code Profiling: Better detection of recursion in the hierarchical view. (Bug [92444](http://bugs.activestate.com/show_bug.cgi?id=92444))
*   Code Profiling: Load the profile data asynchronously. (Bug [92444](http://bugs.activestate.com/show_bug.cgi?id=92444))
*   Debugger: Fix regarding high-bit characters in values (and property names). (Bug [99588](http://bugs.activestate.com/show_bug.cgi?id=99588))
*   Debugger: Support remote debugging from Windows to non-Windows machines. (Bug [99683](http://bugs.activestate.com/show_bug.cgi?id=99683))
*   Editor: Abbreviations: Support auto-abbreviations for all text-like languages, not just the HTML-like ones. (Bug [99817](http://bugs.activestate.com/show_bug.cgi?id=99817))
*   Editor: Added "fast characters", typing ";" before a run of soft characters at the end of a line will move over and harden the soft characters. (Bug [99812](http://bugs.activestate.com/show_bug.cgi?id=99812))
*   Editor: Allow tab to hop over soft characters to the right. (Bug [95685](http://bugs.activestate.com/show_bug.cgi?id=95685))
*   Editor: Easy xml tag movement using Html Tag Relocator command. (Bug [96261](http://bugs.activestate.com/show_bug.cgi?id=96261))
*   Editor: Ensure that pressing tab in a rectangular "line" selection inserts a tab or correct # of spaces at each line. (Bug [99066](http://bugs.activestate.com/show_bug.cgi?id=99066))
*   Editor: If pressing tab and there's a multi-line selection, favor indenting the selection over moving to the next tabstop. (Bug [99067](http://bugs.activestate.com/show_bug.cgi?id=99067))
*   Editor: Mac: Ensure fonts look the same as previous Komodo versions. (Bug [99891](http://bugs.activestate.com/show_bug.cgi?id=99891))
*   Editor: Mac: Ensure margins are redrawn when scrolling the editor. (Bug [99808](http://bugs.activestate.com/show_bug.cgi?id=99808))
*   Editor: When saving as a different filename, only re-guess the language if the file extension has changed. (Bug [99822](http://bugs.activestate.com/show_bug.cgi?id=99822))
*   File Picker: Disable "Unresponsive Script" warnings when browsing for files. (Bug [91614](http://bugs.activestate.com/show_bug.cgi?id=91614))
*   Keybindings: Mac: Allow shifted and unshifted cmd key variations. (Bug [92880](http://bugs.activestate.com/show_bug.cgi?id=92880))
*   Keybindings: Mac: Change jump to matching brace keybinding to Cmd+Shift+M. (Bug [98394](http://bugs.activestate.com/show_bug.cgi?id=98394))
*   Preferences: Ensure lang-specific settings get saved. (Bug [99431](http://bugs.activestate.com/show_bug.cgi?id=99431))
*   Preferences: Fonts: Add preference for controlling anti aliasing and font smoothing (Windows, Mac). (Bug [98036](http://bugs.activestate.com/show_bug.cgi?id=98036))
*   Preferences: Persist language when changed via the file preferences dialog. (Bug [99822](http://bugs.activestate.com/show_bug.cgi?id=99822))
*   Projects: Fixed the "Manage the Most Recent Project Lists" dialog so it actually removes selected projects. (Bug [99770](http://bugs.activestate.com/show_bug.cgi?id=99770))
*   Refactoring: Extract Method: Detect parallel assignments to variables. (Bug [99788](http://bugs.activestate.com/show_bug.cgi?id=99788))
*   Refactoring: Extract Method: Implement extraction of top-level code in Python. (Bug [99441](http://bugs.activestate.com/show_bug.cgi?id=99441))
*   UI: Abyss skin now styles all windows, not just the main editor window. (Bug [99448](http://bugs.activestate.com/show_bug.cgi?id=99448))
*   UI: Fixed skin detection issues on Xubuntu. (Bug [99825](http://bugs.activestate.com/show_bug.cgi?id=99825))
*   UI: Statusbar: Fix background drawing glitch when the loading icon is showing. (Bug [100039](http://bugs.activestate.com/show_bug.cgi?id=100039))
*   UI: Statusbar: Remove background glitch when the loading icon is displayed. (Bug [100039](http://bugs.activestate.com/show_bug.cgi?id=100039))
*   Workspace: Restore the workspace by default. (Bug [99772](http://bugs.activestate.com/show_bug.cgi?id=99772))

### 8.5.0b2 Bug Fixes

*   Debugger: Tcl: Ensure Linux 64-bit remote debug package contains correct executables. (Bug [99608](http://bugs.activestate.com/show_bug.cgi?id=99608))
*   Debugger: Tcl: Ensure the debugger honors hit-count breakpoints. (Bug [98756](http://bugs.activestate.com/show_bug.cgi?id=98756))
*   Dialogs: Stop popup dialogs from using the whole screen width. (Bug [99506](http://bugs.activestate.com/show_bug.cgi?id=99506))
*   Editor: Auto Abbreviations: Disable HTML style and script abbreviations. (Bug [99499](http://bugs.activestate.com/show_bug.cgi?id=99499))
*   Editor: Auto Abbreviations: Allow auto abbreviation command (Ctrl + T) in Text files. (Bug [99605](http://bugs.activestate.com/show_bug.cgi?id=99605))
*   Editor: When opening a file make sure the cursor is in view.  This broke moving to Komodo 8.0. (Bug [98866](http://bugs.activestate.com/show_bug.cgi?id=98866))
*   File Associations: Ensure ".htaccess" is recognized as an Apache file. (Bug [99558](http://bugs.activestate.com/show_bug.cgi?id=99558))
*   Mac: Retina detection has been improved.
*   Open Files: Files will now show SCC icons.
*   Performance: Various performance tweaks to speed up editing, searching and syntax checking.
*   Refactoring: Add a keybinding for the Rename Variable command. (Bug [99440](http://bugs.activestate.com/show_bug.cgi?id=99440))
*   Syntax Checking: CSS: Add a Mozilla based CSS checker. (Bug [89710](http://bugs.activestate.com/show_bug.cgi?id=89710))
*   Syntax Checking: Django: Look for settings.py in sibling directories. (Bug [99362](http://bugs.activestate.com/show_bug.cgi?id=99362))
*   Syntax Checking: HTML: All HTML template languages now default to HTML5 doctype. (Bug [99062](http://bugs.activestate.com/show_bug.cgi?id=99062))
*   UI: Skin: The iconset for the Ambiance skin is now properly detected automatically when Ambiance is auto-selected.
*   UI: Menu Button: The main menubar can now be collapsed into a single toolbar button.

### 8.5.0b1 Bug Fixes

*   Breadcrumbs: Komodo now comes with Breadcrumbs, allowing you to easily navigate the directory structure of the currently opened file.
*   Codeintel: Track line numbers of function-arguments so go-to-definition doesn't go to line 1 column 1. (Bug [99177](http://bugs.activestate.com/show_bug.cgi?id=99177))
*   Debugger: Node.js: Move to upstream _debugger.js. (Bug [98180](http://bugs.activestate.com/show_bug.cgi?id=98180))
*   Debugger: Python: Ensure breakpoints continue to work after exec() builtin is called. (Bug [98951](http://bugs.activestate.com/show_bug.cgi?id=98951))
*   Debugger: Python: Report types of ints and bools correctly, not as "str". (Bug [98546](http://bugs.activestate.com/show_bug.cgi?id=98546))
*   Debugger: Tcl: Ensure the debugger will honor 'break when hit-count is a multiple of X' breakpoint properties. (Bug [98756](http://bugs.activestate.com/show_bug.cgi?id=98756))
*   Debugger: XSLT: Add Linux x86_64 version of the xslt debugger. (Bug [90774](http://bugs.activestate.com/show_bug.cgi?id=90774))
*   Editor: Abbreivations: Allow expanding in single-line comments. (Bug [98154](http://bugs.activestate.com/show_bug.cgi?id=98154))
*   Editor: After opening a file, ensure the caret is visible. (Bug [98866](http://bugs.activestate.com/show_bug.cgi?id=98866))
*   Editor: Better handling of column selection undo. (Bug [99068](http://bugs.activestate.com/show_bug.cgi?id=99068))
*   Editor: Ruby: Syntax-highlighting had trouble distinguishing code like "a&lt;&lt;x". (Bug [99260](http://bugs.activestate.com/show_bug.cgi?id=99260))
*   Editor: Stop invalid scrolling (jumping) back to line 0. (Bug [98577](http://bugs.activestate.com/show_bug.cgi?id=98577))
*   Keybindings: Vi: Preserve the caret position when a search doesn't match anywhere. (Bug [99018](http://bugs.activestate.com/show_bug.cgi?id=99018))
*   Fast Open: Enable shortcuts for upgraded Komodo profiles. (Bug [98889](http://bugs.activestate.com/show_bug.cgi?id=98889))
*   Fast Open: Fixed a memory leak with Fast Open project caching. (Bug [99023](http://bugs.activestate.com/show_bug.cgi?id=99023))
*   Fast Open: Mac: Ensure file icons are not double sized on retina displays. (Bug [98798](http://bugs.activestate.com/show_bug.cgi?id=98798))
*   Formatters: JavaScript: Expose js_beautify formatting options in preferences. (Bug [98905](http://bugs.activestate.com/show_bug.cgi?id=98905))
*   Open Files: Added various sorting and grouping options.
*   Places/Toolbox: Ensure drag/drop works for tree widgets in floating panes. (Bug [98472](http://bugs.activestate.com/show_bug.cgi?id=98472))
*   Projects &amp; Places: You can now double click a folder to expand/collapse it (if "double click to make folder root" is turned off).
*   Publishing: Enforce configurations to have a name. (Bug [96023](http://bugs.activestate.com/show_bug.cgi?id=96023))
*   Remote Files: SFTP: Enable zlib compression if supported by the server. (Bug [98376](http://bugs.activestate.com/show_bug.cgi?id=98376))
*   Startup: Mac: Stop system Python modules from interfering with Komodo's internal Python. (Bug [98957](http://bugs.activestate.com/show_bug.cgi?id=98957))
*   Syntax Checking: Ensure "clear lint results on change" preference works correctly. (Bug [97965](http://bugs.activestate.com/show_bug.cgi?id=97965))
*   Syntax Checking: Don't redraw markers based on an out-of-date error locations; just let the usual editing operations push the markers around. (Bug [97965](http://bugs.activestate.com/show_bug.cgi?id=97965))
*   Toolbox: Add a "treat_as_ejs" field to snippets, default false. Komodo will run snippet code through EJS only when this setting is enabled. (Bug [98464](http://bugs.activestate.com/show_bug.cgi?id=98464))
*   User Interface: Don't change the focus when toggling open the bottom pane.
*   User Interface: Toolbar elements in the bottom pane have been reorganized to be consistent and intuitive.


## <a name="knownissues">Known Issues</a>

To view the status of outstanding Komodo issues,
including those that have been fixed in this release, or to
add comments or additional issues, please visit the
[Komodo
Bug Database](http://bugs.activestate.com/query.cgi?product=Komodo).

### <a name="install_issues" id="install_issues">Installation &amp; Upgrade</a>

*   Windows Vista will prompt you to either 'Allow' or
  'Deny' the installation. Click on 'Allow' and Komodo will
  install normally.
*   The Komodo installer requires up to 230 MB in your
  TMP directory (as indicated by the value of your 'TMP'
  environment variable) during installation, even if you
  plan to install Komodo to another drive. If you do not
  have the required space on this drive, manually set the
  'TMP' environment variable to another directory with
  sufficient space. Ensure that you have enough space,
  temporarily, for installation. (Bug [7057](http://bugs.activestate.com/show_bug.cgi?id=7057))
*   If you try to install Komodo on Windows and the MSI
  install fails with error 2355, your MSI file is corrupt.
  Please download Komodo again and re-run the MSI install.
  (Bug [7405](http://bugs.activestate.com/show_bug.cgi?id=7405))

### <a name="Startup_Issues" id="Startup_Issues">Startup and Shutdown</a>

*   Slow performance on NoMachine (remote desktop) has been
  reported - [bug 93841](http://bugs.activestate.com/show_bug.cgi?id=93841).
*   On Windows, _Direct Folders_ application can cause shutdown hangs
- [bug 101357](http://bugs.activestate.com/show_bug.cgi?id=101357).

### <a name="Editing_Issues" id="Editing_Issues">Editing</a>

*   [Tabstop syntax](http://docs.activestate.com/komodo/latest/tabstops.html) has changed in
  Komodo 5.0. Abbreviation from the Toolbox|Samples directory of pre-5.0
  versions of Komodo will not work as expected with the current
  implementation. Delete the older versions to use the ones featured in
  the "Samples (5.0.0)" directory. Alternatively, if you have made
  modifications to these snippets or have implemented your own using
  tabstops linked by name, consult the documentation and revise
  them using numbered linking.
*   By design, Komodo does not attempt Replace in Files operations on
  unknown file types. However, file association preferences can be used
  to associate a user-defined extension with a language category (e.g.
  "Text") which then enables replacements for that file type.
*   Linux users may need to install the <acronym title="Smart Common
  Input Method">SCIM</acronym> platform packages for non-ASCII text entry.
  See "[Linux Software
  Prerequisites](http://docs.activestate.com/komodo/latest/install.html#System_Req_Lin)" in the Installation Guide for details. (Bug
  70812)
*   While autocomplete on many of the modules in the Python PyWin32
  packages works, Komodo's PyWin32 API catalog currently does not have
  information for: pythoncom and the binary sub-modules of win32com.
*   The macro recorder will record events that it cannot
  handle, such as the opening of dialogs. The only dialog
  that can be opened via a macro is the Find dialog; other
  dialogs will cause the macro to stop.
*   Languages that are read right to left (e.g. Middle Eastern
  languages like Arabic) are not supported. All Latin, Cyrillic and
  Far East languages are fully supported. (Bug [75477](http://bugs.activestate.com/show_bug.cgi?id=75477))
*   On slow networks, users may notice performance
  degradation when editing files on network machines.
  Performance can be improved by disabling the Komodo
  function that checks if files on disk have changed. Use
  the [Editor
  Preferences](http://docs.activestate.com/komodo/latest/prefs.html#prefs_editor) to disable this feature. (Bug [18297](http://bugs.activestate.com/show_bug.cgi?id=18297))
*   Interpolation shortcuts in snippets are not executed
  when the snippet is inserted in the Editor Pane via
  dragging and dropping.
*   On Linux, GTK2 hard codes 'Ctrl'+'Shift' to use
  international input. Therefore, all key bindings
  involving 'Ctrl'+'Shift'+ (any valid hexadecimal
  character) do not work in Komodo. A workaround is to
  start Komodo with the command: `export
  GTK_IM_MODULE=xim; ./komodo'`. Otherwise, key
  bindings of this kind must be changed. (Bug [38205](http://bugs.activestate.com/show_bug.cgi?id=38205))
*   When copying text that does not have Windows line
  endings into another application, which expects Windows
  line endings, the text may not retain the desired
  formatting. The text is often pasted as a single line.
  (Bug [36791](http://bugs.activestate.com/show_bug.cgi?id=36791))
*   Code snippets that are 8-bit-encoded and contain
  high-bit characters may have the wrong encoding (or no
  encoding) when inserted from the Toolbox into a UTF-8
  encoded file in the Editor Pane. (Bug [36769](http://bugs.activestate.com/show_bug.cgi?id=36769))
*   When editing a code comment in Komodo you may use
  &lt;Shift+Enter&gt; to start a new line _within_
  the comment -- the comment prefix is added automatically.
  Komodo may fail to properly add the comment prefix if
  many new lines are added quickly with repeated
  &lt;Shift+Enter&gt; presses. (Bug [38658](http://bugs.activestate.com/show_bug.cgi?id=38658))

### <a name="Debugging_Issues" id="Debugging_Issues">Debugging</a>

*   PHP: The `xdebug.remote_autostart` option will
  interfere with local debugging configuration in Komodo if it is
  enabled. If you need this option enabled for remote debugging, set the
  **Path to alternate PHP configuration file** under
  **Preferences|Languages|PHP** to point to a copy of
  php.ini without this option.
*   PHP: A non-empty `doc_root` setting in _php.ini_
  causes a 'No input file specified' error when starting a local
  debugging session with CGI emulation. The Web Developer Suite 2.0
  package and others use this setting, and it is copied into the
  debugging version of _php.ini_ during PHP auto-config. Comment
  this setting out in the file specified in
  'Preferences|Languages|PHP|Path to alternate PHP configuration file'
  to avoid this problem.
*   Python: Breakpoints will not work with the [Psyco](http://psyco.sourceforge.net/) extension enabled.
  The Komodo [FAQ](http://docs.activestate.com/komodo/latest/trouble.html#psyco_debug) has a
  work-around solution.
*   **Tcl 8.5**: Tcl Beta releases contain
  only version-specific executables (e.g.
  `tclsh85.exe` and `wish85.exe`).
  Komodo does not automatically find these in the path. To
  use them, specify the executables manually in
  **Edit|Preferences...|Languages|Tcl|Interpreters**,
  or create non-versioned symlinks/shortcuts to the
  versioned executables.
*   The Perl debugger uses `alarm()`
  internally. This can conflict with some Perl frameworks
  and modules (such as <acronym title="Perl Object Environment">POE</acronym>) which use
  `alarm()` as well. To work around this
  problem, add `alarm=0` to the
  `PERLDB_OPTS` environment variable (in the
  Environment tab of the Debugger Options) which stops the
  debugger from using `alarm()`. With this
  work-around in place, the Break Now button and menu item
  will not work in debugging sessions.
*   Python debugging with IronPython does not currently
  work as there is no support for Python debugging hooks in
  IronPython.
*   In PerlApp executables, it is now possible to step
  into loaded modules, but not to set breakpoints in
  them.
*   PHP 5.0.0, 5.0.1 and 5.0.2 do not work with the
  debugger extension. You can use PHP version 4.4.x,
  a version greater than PHP 5.0.2.
*   If the debug listener (**Debug|Listen for
  Debugger Connections**) is off, multithreaded
  applications may not run or debug as expected. Only the
  main thread operates through the debugger. To debug
  multithreaded applications, turn on debug listening prior
  to debugging. (Debug listening is turned on by default.)
  (Bug [32776](http://bugs.activestate.com/show_bug.cgi?id=32776))
*   PHP configurations that use Zend Extensions (such as
  PHP Accelerator) are not compatible with the Komodo PHP
  debugger. (Bug [21890](http://bugs.activestate.com/show_bug.cgi?id=21890))
*   Due to the way the core Perl interpreter works, it is
  not possible to step over "require" statements. (Bug
  18776)
*   You cannot debug 'freestanding' executables created
  with the PDK in Komodo. Instead, build a 'dependant'
  executable, which requires a local install of
  ActivePerl.
*   The variable watcher does not work when debugging
  `_\\machine\d$\path\to\perl_script.pl_`.
  It does work when opening the same file via a UNC path
  that does not include a '$' character. (Bug [19558](http://bugs.activestate.com/show_bug.cgi?id=19558))
*   When debugging remote applications, Komodo fails if
  the remote process does not have valid stdout and stderr
  handles. GUI applications, such as those started with
  "wperl.exe" or "pythonw.exe", or those using the
  Pythonwin or wxPython frameworks, or those with certain
  embedded applications, can have invalid stdout and stderr
  handles. Until we resolve this issue, try to run and
  debug your remote program under perl.exe or
  python.exe.
*   Python, XSLT and PHP debugging require TCP/IP to be
  installed and properly configured, even if you are
  debugging scripts locally. While TCP/IP is configured by
  default on most systems, early versions of Windows may
  require manual TCP/IP configuration.
*   When debugging a GUI script in Komodo, adding a
  "watched variable" when _not_ stopped at a
  breakpoint can cause Komodo to hang. You must manually
  terminate the script being debugged to stop Komodo from
  hanging. The problem occurs because the GUI script, while
  in its message loop, does not respond to Komodo's request
  for the variable value. (Bug [23516](http://bugs.activestate.com/show_bug.cgi?id=23516))
*   If the Komodo debugger is configured to use a
  specific port, when Komodo is shut down, the port is
  sometimes not immediately released. If Komodo is
  restarted before the port is released by the operating
  system, a message is displayed advising that the system
  is unable to bind that port. As a workaround, we suggest
  configuring port 0 as the Komodo debugging port and using
  the debugger proxy for remote debugging. (Bug [32821](http://bugs.activestate.com/show_bug.cgi?id=32821))
*   Breaking into a running Perl script can only occur
  while crossing sub boundaries in the Perl code, as that's
  currently the only chance the Perl debugger has to check
  to see if the IDE has sent the break command. (Bug
  35611)
*   When debugging Perl, if you set a breakpoint on the
  `while` statement, the debugger stops on the
  breakpoint only once, namely before the first pass
  through the loop. This is a limitation in the Perl
  interpreter. (Bug [34866](http://bugs.activestate.com/show_bug.cgi?id=34866))
*   Komodo debugger uses TCP/IP networking for
  communications. On systems with firewalls installed, the
  debugger may fail if the firewall is not configured to
  allow Komodo to listen for connections. On Windows, you
  may see a "Windows Security Alert" dialog asking if you
  want to allow Komodo to listen for connections, you will
  need to unblock Komodo. (Bug [21684](http://bugs.activestate.com/show_bug.cgi?id=21684))
*   The Perl debugger cannot trap fatal runtime errors.
  Users can accomplish this in their code by wrapping
  problematic code in an `eval` block, and then
  testing for an exception. (Bug [33855](http://bugs.activestate.com/show_bug.cgi?id=33855))
*   Komodo does not provide proper source debugging in
  Python `exec` and `eval`
  statements. This is a limitation of Python's interpreter.
  (Bug [40336](http://bugs.activestate.com/show_bug.cgi?id=40336))
*   When debugging PHP on a remote Linux machine from a
  local Windows machine, the debugging option "Try to find
  files on the local system when remote debugging" has no
  effect. This is due to differences in Unix and Win32 file
  paths. (Bug [39137](http://bugs.activestate.com/show_bug.cgi?id=39137))
*   When debugging Python, Komodo does not permit you to
  set local variables in the interactive shell. However,
  you can edit those values from the program's variable
  viewers, such as the **Watch** and
  **Locals** panes on the
  **Debug** tab. (Bug [36794](http://bugs.activestate.com/show_bug.cgi?id=36794))
*   When debugging PHP scripts on Komodo with CGI
  emulation, you may need to change the setting for
  `cgi.force_redirect` in the _php.ini_
  file. You may also need to set an environment variable in
  the Debugger Options dialog box: "REDIRECT_STATUS=200
  OK". These settings vary depending on your system and the
  configuration of PHP. (Bug [35021](http://bugs.activestate.com/show_bug.cgi?id=35021))
*   When Debugging PHP, the **HTML** pane of
  the **Output** tab does not refresh
  automatically. To refresh the contents of this pane,
  click the "Reload HTML view" button on the
  **Output** tab. (Bug [36999](http://bugs.activestate.com/show_bug.cgi?id=36999))
*   Komodo supports full Unicode debugging with Perl 5.8.
  Although Perl 5.6 can be used for debugging programs with
  single-byte encodings (e.g. cp1251), it is recommended
  that programmers with multi-byte character sets upgrade
  to Perl 5.8.5 or better. (Bug [36760](http://bugs.activestate.com/show_bug.cgi?id=36760))
*   When debugging Python, if you launch the debugger
  from a directory containing a module with the same name
  as one of the modules used by the debugger, the wrong
  file is used. For example, if you have a file named
  _logging.py_ in the directory where the debugger
  is launched, the debugger will fail. (Bug [36783](http://bugs.activestate.com/show_bug.cgi?id=36783))
*   When stepping through Perl files, the Komodo debugger
  displays the wrong print results in the
  **Locals** window of the
  **Debug** tab. This is because Perl provides
  only one iterator for each collection variable. The
  Komodo debugger must iterate through a hash or an array
  in order to display the values in Komodo. A workaround is
  to display the **Watch** pane instead of the
  **Locals** pane, and type the names of the
  expressions that you want to view. (Bug [33668](http://bugs.activestate.com/show_bug.cgi?id=33668))
*   As of Komodo 5.0, the Perl debugger emits numeric hash keys with
  embedded underscores. For example, a hash key of '123456789' now
  appears in the variables tabs as '123_456_789'.
*   Breakpoints don't work in files with symlinks in their path. The
  debugger engine calculates whether to break based on the actual file
  path. To work around this limitation, load the file in Komodo using
  the real path, or create a hard link (e.g. on Linux, use 'ln' without
  the '-s' option). (Bug [79147](http://bugs.activestate.com/show_bug.cgi?id=79147))

### <a name="Interactive_Shell_Issues" id="Interactive_Shell_Issues">Interactive Shell</a>

*   The interactive shell does not initialize properly when invoked
  while the Command Output tab has focus. To avoid this, switch focus to
  another tab or sidebar before starting the interactive shell.
*   Perl: Only pattern variables $1 .. $9 are preserved
  across each query. (Bug [34528](http://bugs.activestate.com/show_bug.cgi?id=34528))
*   Python: The getpass package requires the use of a tty
  on UNIX systems. Komodo does not provide a tty in its
  interactive shell so getpass will fail with an exception.
  (Bug [34259](http://bugs.activestate.com/show_bug.cgi?id=34259))

### <a name="Source_Code_Control_Issues" id="Source_Code_Control_Issues">Source Code Control</a>

*   The SCC Checkout wizard, SCC Commit and SCC Push features does not
  correctly handle password authentication. SCC commands requiring password
  authentication should be done at the command line, or be setup to use
  password-less authentication mechanisms.
*   A bug in CVS will cause WinCVS and TortoiseCVS to
  detect file changes when a Komodo project has merely been
  opened. The problem is likely a bug in the cvshome.org
  executable or in the cvsnt.org executable, which are used
  by both WinCVS and TortoiseCVS. (Bug [21085](http://bugs.activestate.com/show_bug.cgi?id=21085))
*   Komodo's integration with the Perforce commit/submit
  command cannot commit files that are not in the default
  changelist. These files must be submitted via an external
  interface (e.g. p4, P4Win). Note that any files checked
  out inside Komodo are in the default changelist, so this
  limitation should only apply to users who already use an
  external interface to their Perforce repository. (Bug
  27070)
*   If the Perforce connection cannot be established,
  checking the status of files in a Perforce repository
  will hang Komodo. (Bug [35058](http://bugs.activestate.com/show_bug.cgi?id=35058))
*   If you are using CVS Source Code Control, note that
  the very first time you log in to a repository, cvs.exe
  fails to create the .cvspass file correctly and will
  return an error. Repeat the command to login a second
  time and correctly generate the file. This is a CVS bug.
  (Bug [20353](http://bugs.activestate.com/show_bug.cgi?id=20353))

### <a name="OSX_Issues" id="OSX_Issues">Mac OS X</a>

*   If you have two drives with the same name, and you
  use the file open dialog in a Mozilla application, the
  directory menu (top middle of dialog) may crash when
  clicked. To avoid this, rename one of the hard
  drives.
*   New Custom Menus created in a Project or in the
  Toolbox will not appear until Komodo has been
  restarted.
*   Throughout the Komodo documentation there are
  references to key bindings that use the 'Cmd' key. This
  key may be better known to OS X users as the 'Command'
  key. (Bug [41959](http://bugs.activestate.com/show_bug.cgi?id=41959))
*   Komodo will shut down and restart itself the first
  time it is run after installation. (Bug [40143](http://bugs.activestate.com/show_bug.cgi?id=40143))
*   Display of text during editing ("painting") may
  sometimes be slow or pause momentarily.
*   Certain UI elements stop working after changing key
  bindings. Restarting Komodo fixes this. (Bug [38683](http://bugs.activestate.com/show_bug.cgi?id=38683))
*   When saving a file, Komodo does not set file
  information (type and creator) for the OS X Finder to
  know that Komodo created the file. (Bug [38745](http://bugs.activestate.com/show_bug.cgi?id=38745))
*   Breakpoints cannot be removed when debugging XSLT
  scripts. (Bug [40072](http://bugs.activestate.com/show_bug.cgi?id=40072))
*   PHP debugging will not work with the PHP build
  distributed with OS X because it does not load external
  modules. To use PHP debugging on OS X, build PHP from
  source or download a binary from [http://www.entropy.ch/software/macosx/php](http://www.entropy.ch/software/macosx/php)

  (Bug [39901](http://bugs.activestate.com/show_bug.cgi?id=39901))
*   Komodo is sometimes recognized as a web browser by
  some applications on OS X (e.g. Safari's "Default Web
  Browser" setting). Using Komodo as the default web
  browser is not recommended.
*   Application menu items that have multi-key key
  bindings will not show their key bindings in a pop-up
  tool tip on OS X. This is a limitation in OS X.
*   Context menus may not display unless you hold down
  the mouse button for a period of time. This is because
  the Komodo editor is implemented in Mozilla as a plugin,
  and it does not access the appropriate context menu event
  to handle this behavior properly without interfering
  with other mouse events (for example, drag and drop).
  (Bug [41216](http://bugs.activestate.com/show_bug.cgi?id=41216))
*   Due to a limitation in the Mozilla code base, key
  bindings for the **Next File** and
  **Previous File** options on the
  **Window** menu are not displayed next to
  the menu items. The key bindings are 'Cmd'+'PageDown' to
  view the next file and 'Cmd'+'PageUp' to view the
  previous file. (Bug [40716](http://bugs.activestate.com/show_bug.cgi?id=40716))

### <a name="Linux_Issues" id="Linux_Issues">Linux</a>

*   The **Fonts and Colors** pane in the
  Preferences dialog box displays the same list of fonts in
  both the Fixed and Proportional lists. There is no
  programmatic way to identify whether a font is
  proportional or not on GTK; therefore, users must know
  the properties of the individual fonts when modifying
  these values. (Bug [27206](http://bugs.activestate.com/show_bug.cgi?id=27206))
*   Install Komodo into a directory path that only
  includes alphanumeric characters. Komodo is known to have
  trouble with paths that include spaces and some
  non-alphanumeric characters.
*   Key bindings defined in the window manager (such as
  KDE) take precedence over Komodo key bindings. In the
  case of conflicts, you must either change the Komodo key
  bindings or the window manager key bindings. (Bug
  30926)
*   You cannot move an existing Komodo installation to a
  new directory. You must uninstall Komodo from the
  existing location and reinstall it in the new location.
  (Bug [19478](http://bugs.activestate.com/show_bug.cgi?id=19478))
*   Red Hat Linux 9.0 is known to have threading library
  bugs in its glibc that may cause Komodo to hang in
  certain situations. The recommended solution is to
  upgrade to the latest glibc for Red Hat Linux 9.0. (Bug
  24340)
*   Using colon-separated include paths in the Perl
  shebang line causes a parse failure on some versions of
  Perl. Instead of using "/usr/bin/perl -cwT
  -I/path1:/path2 yourscript.pl", try using multiple
  include arguments such as "/usr/bin/perl -cwT -I/path1
  -I/path2 yourscript.pl"

      (Bug [33524](http://bugs.activestate.com/show_bug.cgi?id=33524))
*   Komodo may not start up correctly on some Linux
  systems if C++ compatibility libraries have not been
  installed. On Fedora and Red Hat systems, install the
  "compat-libstdc++" package. On SuSE, install the "compat"
  package. On Gentoo, as root, run `emerge
  lib-compat`. This is not thought to be a problem on
  Debian systems. (Bug [36244](http://bugs.activestate.com/show_bug.cgi?id=36244))
*   Komodo is not compatible with Kubuntu 11.04 or OpenSuSE
  11.4.  Workaround in bug (Bug [90985](http://bugs.activestate.com/show_bug.cgi?id=90985#c26)).

### <a name="Other_Issues" id="Other_Issues">Other</a>

*   A limitation in the parser used by the DOM Viewer
  causes HTML elements embedded in JavaScript strings to
  appear as element nodes of the current document. Placing
  the JavaScript in a CDATA section or a comment avoids
  this problem.
*   Komodo inherits a Mozilla bug whereby certain video
  drivers on Windows cause Komodo to crash. If you
  experience this behavior, upgrade your video driver to
  the latest version. If the problem persists, reduce the
  color definition assigned to the driver (**Control
  Panel|Display|Settings**). (Bug [32746](http://bugs.activestate.com/show_bug.cgi?id=32746))
*   Komodo inherits a [Mozilla
  bug](http://bugzilla.mozilla.org/show_bug.cgi?id=230512) regarding display on dual-monitor systems where
  the secondary monitor is to the left of the primary
  monitor (causing negative coordinate results). The Komodo
  display occasionally fails to refresh; Komodo must be
  stopped and restarted to fix the display (Bug [26852](http://bugs.activestate.com/show_bug.cgi?id=26852))
*   The Palm Desktop for Windows software makes exclusive
  use of the 'Ctrl'+'Shift'+'T' key combination, thus
  making this combination unavailable in Komodo. (Bug
  27851)
*   When using the PDK **Build Standalone
  Application** feature in Komodo with Perl 5.8.0 on
  a Linux installation where the environment is set to use
  UTF-8, you must add a module 'utf8' on the modules tab.
  This is the equivalent of 'perlapp --add utf8'. This does
  not affect Perl 5.6.x or future versions of Perl 5.8.1 or
  higher. (Bug [26898](http://bugs.activestate.com/show_bug.cgi?id=26898))
*   On Windows, some interactive commands may not work
  properly when run from the **Command
  Output** tab of the Output Pane. You must run
  these commands in a separate shell. (Bug [23176](http://bugs.activestate.com/show_bug.cgi?id=23176))
*   Perforce client version 2001.1 and previous for
  Windows is known to hang when used for Komodo's Perforce
  integration. Upgrading to the most recent version of
  Perforce is known to fix the problem. (Bug [19959](http://bugs.activestate.com/show_bug.cgi?id=19959))
*   The Output tab cuts off lines at 250 characters. (Bug
  20711)
*   Macros will not record certain commands, including
  (but possibly not limited to)
  'Ctrl'+'Shift'+'B'|'R'|'E'|'D' (toggle toolbars or button
  text), 'Ctrl'+'Shift'+'N' (new default file), and View as
  Language menu items.
*   If you are using the Pop-Up Stopper ad-blocking
  program (Pop-Up Zapper on OS X), it will close the Rx
  Toolkit window immediately after it is opened. (Bug
  21768)
*   When you schedule a new file to be added using CVS,
  CVS will not permit you to remove the file from the
  repository using the "revert changes" command. (Bug
  27192)
*   Users of the Japanese version of Windows XP may
  experience difficulties in starting Komodo.
*   The **Open** field in the Open/Find
  Toolbar does not automatically display a drop-down list
  of directories when an UNC path is typed. Currently, the
  list is only displayed when a the path includes a
  subdirectory. (Bug [29011](http://bugs.activestate.com/show_bug.cgi?id=29011))
*   When creating a "diff" in Komodo
  (**Tools|Compare Files**), the line endings
  of the files are normalized to Unix style line endings.
  Lines in files that have different line endings are not
  displayed differently in the diff (unless other
  differences are present), but a warning is provided to
  the user in the 'diff' window, or the 'no difference'
  dialog. (Bug [32932](http://bugs.activestate.com/show_bug.cgi?id=32932))
*   In Komodo's Rx Toolkit, the match offsets for Unicode
  or high-bit data are incorrect. When matching, the
  program does not account for UTF-8 multi-byte characters.
  (Bug [33287](http://bugs.activestate.com/show_bug.cgi?id=33287))
*   When adding new key bindings via the Preferences
  dialog box, Komodo displays a message indicating that the
  key bindings will not take effect until Komodo is
  restarted. However, some changes do take effect
  immediately.(Bug [36710](http://bugs.activestate.com/show_bug.cgi?id=36710))
*   If you rename a folder that was added to a custom
  menu, the name is changed in Komodo's Toolbox but not on
  the menu itself. A workaround is to move the renamed
  folder out and then back into the associated custom menu
  icon in the Toolbox. (Bug [36679](http://bugs.activestate.com/show_bug.cgi?id=36679))
*   A newly created custom menu is added to the Toolbox
  but is not immediately displayed alongside existing
  toolbars. Restarting Komodo causes the new toolbar to
  display. (Bug [40078](http://bugs.activestate.com/show_bug.cgi?id=40078))
