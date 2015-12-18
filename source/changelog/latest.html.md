---
title: Komodo 9.x Changelog
sidebar: download
classNames: small-text markdown
---

# Komodo IDE/Edit 9.x Release Notes

These Release Notes cover [what's new](#whatsnew), [detailed changes and bug fixes](#details) and [known issues](#knownissues) for Komodo IDE and Komodo Edit.

<a name="whatsnew"></a>
## What's New in Komodo IDE/Edit

### 9.3.2

Maintenance release, see detailed changes [below](#details).

### 9.3.1

Maintenance release, see detailed changes [below](#details).

### 9.3

 * **Documentation browser (IDE)**: Allows you to quickly navigate the
   documentation for our codeintel supported languages. Giving you quick access
   to basic documentation, with shortcuts to online documentation and contextual
   actions (insert snippet). This is entirely keyboard driven through Commando.
   
 * **Run Code In-Line (IDE)**: Hit a shortcut to run the current the current
   file using the configured interpreter, then quickly review its results.
   Useful to quickly test bits of code. This works on unsaved files as well as
   selections (ie. run only the selected text).
   
 * **Quick Bookmarks**: Quickly place numeric bookmarks and go to them, allowing
   you to use bookmarks as more than just reminders. Hit Ctrl+Shift+number to
   place a quick bookmark, then hit Ctrl+number to go to that bookmark.

 * **Console Widget**: The new Console pane allows you to interact with the
   Komodo runtime much in the same way as you would use your browser developer
   tools console to interact with a website. This is especially useful for
   developers wanting to customize their Komodo experience.

 * **CSS Auto-Completions**: CSS, LESS, and SCSS files now support
   auto-completions and code browsing. This will also work when editing HTML and
   using CSS classes or ID's in your markup. With the 9.3.0 release this only
   works for CSS files living at the same or a lower level as the HTML file, we
   will very soon be supporting this project wide.

 * **Auto-Wrap Delimiters**: When pressing a delimiter (eg. double quotes) while
   having text selected the text will be wrapped by that delimiter. Delimiters
   are configurable from your Preferences and can be disabled entirely.

 * **Auto multi-caret for HTML/XML tags**: When selecting an HTML (XML) tag the
   corresponding start/end tag will also be selected, allowing you to change the
   start and end tag without having to select each individually.

 * **Elastic Tabstops**: Komodo now supports [Elastic
   Tabstops](http://nickgravgaard.com/elastic-tabstops/). Since this is intended
   only for files that use tab characters for indentation it is disabled by
   default. You can enable it under Indentation Preferences.

 * **In-line Syntax Checking:** When syntax errors/warnings occur a small
   notification popup will show at the bottom right corner of your editor
   window.
 
 * **Package Manager 2.0:** You can now fully manage your packages via Komodo,
   ie. uninstall, update, etc. (the previous version only allowed you to
   install). Advanced functionality currently only works for addons, skins, and
   languages.
 
 * **Enhanced Multi-Caret Mode:** Multiple caret mode is now much more flexible
   and useful, allowing for more complex actions than before. You can also now
   set multi-carets with ctrl+click.

 * **Embedded Find/Replace:** Find and replace has been significantly overhauled
   and is now part of the editor (rather than a popup dialog).

 * **Multiple Find Result Tabs:** Every search now opens in its own result tab,
   you are no longer limited to 2 tabs. Find results now also show a new input
   field that allow you to search again with the same input but a different
   search pattern.

 * **Macros renamed to Userscripts:** Toolbox Macros have been renamed to
   Userscripts. Macros also still exist but only through the toolbar or menu
   interface. When you save them to your toolbox they effectively become
   userscripts.

 * **Quick Start on Tabs:** When opening a new tab you now get a view that lets
   you pick what to do with the tab; eg. create a new file, open files, new file
   from template, recent file, etc.

 * **New & Improved File Icons:** The language icons have been updated to be
   more distinctive and less generic looking.

 * **Commando has gotten a visual overhaul:** More lightweight, no borders or
   gradients. Commando now feels as lightweight as it is.

 * **Tons and tons of UX improvements:** An ongoing effort to make Komodo the
   most user friendly IDE out there by many miles.

### 9.2.1

Maintenance release, see detailed changes [below](#details).

### 9.2

 * Docker and Vagrant Integration (IDE only) - You can now interact with Docker and Vagrant using Commando (under Commando > Shell).
 * Collaboration Overhaul (IDE only) - Collaboration has been given a significant face-lift and is now a joy to work with! Code better with your teams with our updated collab tool.
 * Real-time (in-line) spell checking (IDE Only) - Komodo will now check your code for spelling errors in real-time, and allow you to easily address spelling errors right within the editor.
 * Package Installer - We are introducing an all new way to install addons, color schemes, skins, keybindings, languages, etc. Simply by using Commando, you can now install all your favourite "Packages" (previously called "Resources" or "Extensions").
 * EditorConfig Integration (see issue [#271](https://github.com/Komodo/KomodoEdit/issues/271)) - Komodo now checks for .editorconfig files in your path, [you can read more about this here](http://komodoide.com/blog/editorconfig-your-komodo/).
 * Focus Mode (aka Distraction Free Mode) - Clean up your IDE: easily hide non-essential UI with a keystroke, [you can read more about this here](http://komodoide.com/blog/focus-mode-aka-distraction-free-mode-in-komodo/).
 * CSS3 Autocompletions - We already supported a ton of CSS3 in our autocompletions, but [thanks to Defman](https://github.com/Komodo/KomodoEdit/pull/434) we now support all of CSS3.
 * Crisper UI - Particularly when using dark color schemes, the UI could feel a little bit "fuzzy" in the past, but no longer is that the case!
 * A boatload of Commando enhancements and fixes (see below)

### 9.1

 * **Package Manager integration**: You can now easily install and uninstall packages
   using Commando, as well as perform all sorts of specific package manager actions.
   Support for the following package managers (*IDE only*):
   * Bower (web front-end)
   * NPM (Node.JS)
   * Composer (PHP)
   * Gem (Ruby)
   * PIP (Python)
   * CPAN (Perl)
   * PyPM (Python)
   * PPM (Perl)
 * **Scope Shell**: Commando has a new "shell" scope which allows you to easily run commands with minimum interruption from your workflow (*IDE only*).
 * **Workspace management** has been significantly improved. Save your UI state and
   opened files and restore them whenever you'd like (*IDE only*).
 * Select Commando (Go to Anything) results by pressing ALT+number.
 * The Commando user experience has had significant usability improvements.
   Most notably when starting Commando you will now be presented with a convenient list of scopes that you can use to narrow down your search results.
 * **Other Mentionables**
    * Color Schemes: Use foreground color for caret color - fixes [#75](https://github.com/Komodo/KomodoEdit/issues/75).
    * Commando: Don't preserve query when navigating backwards.
    * Commando: Escape now clears the current search.
    * SDK: Added the "shell" SDK, allowing you to easily run shell commands.
    * UI: Improved scrollbar contrast on dark color schemes.
    * UI: "Ugly border" showing around notifications on windows - fixes [#108](https://github.com/Komodo/KomodoEdit/issues/108).
    * CodeIntel: Improve PHPDoc tooltip legibility - contributed by Defman - [PR #225](https://github.com/Komodo/KomodoEdit/pull/255)

### 9.0

*   **Track Changes**: The editor has gained a new left margin,
        which highlights unsaved changes, as well as any uncommitted SCC
        changes. Clicking on the margin will show a diff dialog of the changes,
        and you can also revert these individual changes.

*   **Markdown Viewer**: When a markdown file is open in
        Komodo, you'll be able to easily HTML preview that markdown with a click
        of a button. The Komodo markdown viewer uses GitHub markdown styling.

*   **Go Lang**: Initial support for the Go programming
        language has been added to Komodo. It provides syntax coloring, code
        folding, syntax checking (linting) and code intelligence with
        completions, calltips, outline and goto definition.

*   **Commando**: This popup dialog is the combined successor
        of the "Fast Open" dialog and "Invoke Tool" dialog. Commando provides
        the following search tools and features:

    *   fuzzy matching
    *   string match highlighting in the results panel
    *   find any file under a particular folder
    *   tool (macro, run command, snippet, ...) search
    *   bookmark integration
    *   shortcuts (go-tool) integration
    *   custom category filtering
        Commando also comes with an easy to use API so that you can easily add
        your own custom search "scopes".

*   **Kopy.io**: This allows you to easily share snippets of
        code with other people (like a pastebin) directly from Komodo. Simple
        make a text selection and right-click and use the _Share Code via
        Kopy.io_. Even better is that Kopy.io supports client side
        encryption, so you can make those shared pastes more secure.

*   **Notifications**: Messages shown to the user now appear in
        a separate popup panel that overlays the main Komodo editor window
        (previously they appeared in the Komodo statusbar). There are
        notification preferences which allows you to control which messages get
        displayed in the popup panel.

*   **Icons**: Most of the Komodo UI icons have been updated -
        here is a list of the most noticeable icon changes:

    *   file icons
    *   language icons
    *   places icons
    *   toolbox icons
    *   preference page
    *   code intelligence icons (completions, sections list, code browser)

*   **Color Schemes**: We've changed all the default Komodo
        color schemes. All schemes included in Komodo are now Base16, that is,
        they are based on a set of 16 different base colors, which are re-used
        by different parts of the scheme. You can also tweak the editor line
        height spacing now directly in the color scheme preferences page.

*   **Menu Bar**: The Komodo main menu bar is now hidden by
        default (Windows and Linux. You can use the Alt key to toggle the menu
        visibility. Whilst the top-level menu is hidden, the unified button menu
        will be visible in the toolbar. You can also control menu visibility
        through the _View > Toolbars_ menu.

*   **PHP 5.6 Support**: We've added support for PHP 5.6, with
        a new Xdebug module (for PHP debugging and Code Profiling), updates for
        keyword changes and updates to code intelligence to provide the latest
        API data for PHP 5.6.

*   **Python PEP 8 Syntax Checking**: PEP 8 syntax checking has
        been added. You can turn it on by visiting the Python Syntax Checking
        preferences. For those that don't know - PEP 8 is the official style
        guide for Python code.

*   **CSS Code Formatting**: Komodo now includes a CSS code
        formatter - so you can keep your CSS looking beautifully structured.
        We're using a JavaScript
        [CSS Beautify](https://github.com/senchalabs/cssbeautify)
        library from Sencha Labs.

*   **Komodo Developer APIs**: We've been overhauling the
        Komodo APIs, to make it easier to load and access the methods inside
        of Komodo. We're now making use of CommonJS (aka Node.js)
        _require()_ calls to load individual modules - you can see the
        full list of supported modules in the
        [sdk directory](https://github.com/Komodo/KomodoEdit/tree/master/src/chrome/komodo/content/sdk).
        Examples and more information can be found in the
        [Komodo wiki](https://github.com/Komodo/KomodoEdit/wiki/Komodo-9-Require).
        We've also added convenient _console.log()_ and friends support -
        the messages show up in the Komodo Notifications pane.

*   **Performance**: Various performance tweaks were made to
        Komodo to improve the editing performance, as well as improving the
        search speed, syntax checking times and general responsiveness of
        Komodo.

*   **Other Mentionables**

    *   Statusbar has moved to be above the bottom pane (attached to the editor view)
    *   CSS code formatter was added
    *   Preference page now has a simple and advanced mode
    *   Startpage has been removed - instead a _Quick Launch_ page is shown when no views are opened
    *   Workspaces can be saved and loaded on demand - see the _File &gt; Workspace_ menu
    *   High DPI configurations on Windows should work correctly - no blurred fonts
    *   Tab Width indentation preference has changed from 8 spaces to 4 spaces
    *   Find Results now has a toolbar command to copy the find results to the clipboard
    *   SCC Commit dialog now displays the current branch name
    *   Re-organised various menus, including tab and editor context menus
    *   Sections list (IDE) has merged with breadcrumbs widget
    *   Tabs v's spaces indentation detection was improved
    *   Komodo was updated to use the Mozilla 31 code base
    *   Opt-in analytics module was added. This is entirely optional and we do not track user specific information.
    *   Komodo Sync has been removed for Komodo 9; similar functionality may be re-introduced in a later version of Komodo.

<a name="details"></a>
## Detailed Changes and Bug Fixes in Komodo IDE/Edit

Changes related to Debugging, Interactive Shells, Source Code
Control, HTTP Inspector, Rx Toolkit, Code Browser, Database Explorer
and the Sections List only apply to Komodo IDE only.

### 9.3.2

 * Collab: Fix issue where user indicators would show on top of windows.
 * Collab: Use tooltip instead of panels, to eliminate focus issues.
 * EditorConfig: Reverted a change that made some prefs not apply - fixes [#908](https://github.com/Komodo/KomodoEdit/issues/908).
 * Find: Fix "where" section not remembered - fixes [#873](https://github.com/Komodo/KomodoEdit/issues/873).
 * Find: Keep focus inside find frame when tabbing - fixes [#888](https://github.com/Komodo/KomodoEdit/issues/888).
 * Fixed regression in Perl interpolated variable highlighting with Scintilla upgrade - fixes [#914](https://github.com/Komodo/KomodoEdit/issues/914).
 * Linter: Show at most 10 results at a time.
 * Non-scannable UDL languages like XML do not have scopes; do not raise errors - fixes [#906](https://github.com/Komodo/KomodoEdit/issues/906).
 * Notifications: Corner notifications should not be too wide.
 * Notifications: Fixed notifications stealing focus, for real this time - fixes [#816](https://github.com/Komodo/KomodoEdit/issues/816), fixes [#837](https://github.com/Komodo/KomodoEdit/issues/837).
 * Projects: Fix editor prefs missing under Project prefs - fixes [#929](https://github.com/Komodo/KomodoEdit/issues/929).
 * Projects: Fixed [#860](https://github.com/Komodo/KomodoEdit/issues/860) can't open projects with " " in name.
 * Projects: Places opens in wrong context in newWindow. fixes [#932](https://github.com/Komodo/KomodoEdit/issues/932).
 * SCSS: Use '//' for line comments in SCSS - fixes [#866](https://github.com/Komodo/KomodoEdit/issues/866).
 * UI: Highlight focused elements in the HUD - fixes [#883](https://github.com/Komodo/KomodoEdit/issues/883).
 * codeintel: Buffers with only one token should not cause errors anymore - fixes [#796](https://github.com/Komodo/KomodoEdit/issues/796).
 * codeintel: Do not create extra, unnecessary CIX files on Windows - fixes [#870](https://github.com/Komodo/KomodoEdit/issues/870).
 * codeintel: Do not error on blank documents - fixes [#895](https://github.com/Komodo/KomodoEdit/issues/895).
 * codeintel: PHP: Fixed interface method inheritence - fixes [#751](https://github.com/Komodo/KomodoEdit/issues/751).
 * codeintel: golang: Fixed codeintel crash in some instances of "goto definition" - fixes [#461](https://github.com/Komodo/KomodoEdit/issues/461).
 * editor: Do not auto-expand abbreviations when recording macros or when there is a column selection - fixes [#811](https://github.com/Komodo/KomodoEdit/issues/811).
 * editor: Fixed out-of-control drag-and-drop for large files and word wrap - fixes [#901](https://github.com/Komodo/KomodoEdit/issues/901).
 * editor: Ignore smart wrapping when performing a key combination - fixes [#865](https://github.com/Komodo/KomodoEdit/issues/865).
 * editor: minimap: Do not allow markers to be shown - fixes [#855](https://github.com/Komodo/KomodoEdit/issues/855).
 * Projects: Fixed projects failing to open in new windows due to space in filename - fixes [#860](https://github.com/Komodo/KomodoEdit/issues/860).

### 9.3.1

 * Commando: Fix miss-alignment when opened from the toolbar - fixes [#789](https://github.com/Komodo/KomodoEdit/issues/789).
 * Commando: Fix non-recursive searches not working - fixes [#834](https://github.com/Komodo/KomodoEdit/issues/834).
 * Console: Fixed object keys not dumping in some cases - fixes [#790](https://github.com/Komodo/KomodoEdit/issues/790).
 * Debug: Fix run without debugging throwing error - fixes [#835](https://github.com/Komodo/KomodoEdit/issues/835).
 * Find: Restore focus after the find frame closes - fixes [#805](https://github.com/Komodo/KomodoEdit/issues/805).
 * Linting: Only notify about the first linting error (don't bombard users with notifications) - fixes [#818](https://github.com/Komodo/KomodoEdit/issues/818).
 * OpenFiles: Fix tab sorting won't toggle - fixes [#841](https://github.com/Komodo/KomodoEdit/issues/841).
 * Runinline: Consider global environment preferences - fixes [#810](https://github.com/Komodo/KomodoEdit/issues/810).
 * Troubleshooting: Fix safe-mode on OSX - fixes [#776](https://github.com/Komodo/KomodoEdit/issues/776).
 * UI: Fix missing checkmark icons in menu's on OSX - fixes [#801](https://github.com/Komodo/KomodoEdit/issues/801).
 * debugger: All versions of NodeJS should be supported now - fixes [#747](https://github.com/Komodo/KomodoEdit/issues/747).
 * elastic tabstops: Respect tab width preference - fixes [#820](https://github.com/Komodo/KomodoEdit/issues/820).
 * install: More robust GDK version checker for Linux - fixes [#799](https://github.com/Komodo/KomodoEdit/issues/799).
 * CodeIntel: Autocompletion doesn't show in some cases - fixes [#871](https://github.com/Komodo/KomodoEdit/issues/871).
 * CodeIntel: CSS codeintel should read all CSS files in the project - fixes [#783](https://github.com/Komodo/KomodoEdit/issues/783).

### 9.3.0

 * CSS: Fixed CSS linting.
 * CoffeeScript: Fixed lexing of numeric ranges - fixes [#387](https://github.com/Komodo/KomodoEdit/issues/387).
 * Collab: Improve contact request user experience.
 * Commando: Commando now includes project live folders in file searches - fixes [#116](https://github.com/Komodo/KomodoEdit/issues/116).
 * Commando: Fix issue where results would not update - fixes [#515](https://github.com/Komodo/KomodoEdit/issues/515).
 * Commando: Fix results not aligning properly.
 * Commando: Improve responsiveness (reduce UI blocking).
 * Commando: Limit the search depth for files - fixes [#545](https://github.com/Komodo/KomodoEdit/issues/545).
 * Commando: Shell: Don't default to running in container commands in an external terminal.
 * Commando: Shell: Fix autocompletion triggering on partial matches.
 * Commando: Shell: Show more appropriate information about running containers.
 * Commando: Updated commando dialog styling to be less border-heavy.
 * Commando: Will now save the state for the scope that Commando is initialized with.
 * Commands: The Command Output widget now allows you to run quick commands right from the widget.
 * CommonJS: ko/editor: add gotoLine. Defaults for `_posToAbsolute`.
 * Console: Added a new console widget, which lets you quickly access the Komodo javascript runtime.
 * Date: Thu Sep 24 12:24:39 2015 -0400.
 * Do not attempt to toggle breakpoints in terminal views - fixes [#133](https://github.com/Komodo/KomodoEdit/issues/133).
 * Docs: The Komodo help dialog has been removed in favour of the new documentation site.
 * Documentation Browser: Komodo now comes with a built-in documentation browser, covering anything from Komodo itself to the API's of your favourite languages.
 * Editor: Fix unsaved changes not reflecting changes on disk - fixes [#83](https://github.com/Komodo/KomodoEdit/issues/83).
 * Editor: Support rename-tag in languages that can contain HTML (eg. php).
 * Editor: The find/replace window is now embedded into the editor, just like quick find.
 * EditorConfig: Make editorconfig less aggressive, don't set any prefs and don't force a pref if it was already explicitly set.
 * Find: Each search now opens in its own tab, so you can have as many searches open as you like.
 * Find: Expose find prev results for results tab.
 * Find: Find All button appears in Repace dialog. Fixes [#733](https://github.com/Komodo/KomodoEdit/issues/733).
 * Find: MarkAll btn didn't appear if Rplc enabled while dialog open.
 * Find: Tabbing order in embedded find. Fixes [#734](https://github.com/Komodo/KomodoEdit/issues/734).
 * Find: fix cmd_findNextResult (fixed [#136](https://github.com/Komodo/KomodoEdit/issues/136)).
 * General: Added new troubleshooting options that will reset certain aspects of your Komodo configuration.
 * General: Expose "show quick launch" ability to user through a command.
 * HUD: Hud styling has been made more flat and more contrasting.
 * History: Komodo now stores your history as you move through a file, letting you go back to previous areas you visited.
 * Icons: Added FontAwesome icons, allowing you to use font awesome for your tools and addons.
 * Icons: Generated icons now try to be a little bit more stylish.
 * Icons: Hud icons now actually use hud colors.
 * Icons: The language icons for our main languages have been updated to reflect their official logo.
 * Linter: Lint messages are now shown above the syntax checking icon as they occur.
 * Notifications: Most notifications will now show in a smaller pop-in at the bottom right of the screen.
 * Notifications: You can now disable opacity and/or animations for notifications.
 * Notify: Fix notify stealing focus.
 * OSX: Ensure view is visible after un-hide - fixes [#564](https://github.com/Komodo/KomodoEdit/issues/564).
 * Open Files: Tabs can now be sorted according to the open files sort settings.
 * Open Files: You can now close file groups or all files from the Open Files widget.
 * Packages: Addon management is now fully handled through Commando, the old addon interface has been disabled.
 * Perl: Updated to native Scintilla Perl lexer - fixes [#525](https://github.com/Komodo/KomodoEdit/issues/525).
 * Places: Fixed renaming files with the same case-insensitive name on Windows - fixes [#155](https://github.com/Komodo/KomodoEdit/issues/155).
 * Publishing: Fixed auto push not working when path has spaces - fixes [#505](https://github.com/Komodo/KomodoEdit/issues/505).
 * Quickbookmarks: Add editor context menu.
 * Run In-Line: You can now quickly run your current file/selection without saving.
 * SDK: Added debug module, currently it's only use is to retrieve the size of a javascript object.
 * SDK: Editor: Made the editor SDK more flexible. You can now use it with custom scintilla instances.
 * SDK: File: Don't depend on Mozilla SDK for dirname and basename.
 * Scintilla: Highlight JavaScript and CoffeeScript regex properly - fixes [#414](https://github.com/Komodo/KomodoEdit/issues/414).
 * TCL: Updated the TDK dependencies to 5.4.1.
 * Tcl: Fixed Tcl lexer to update fold levels when exiting line comments - fixes [#590](https://github.com/Komodo/KomodoEdit/issues/590).
 * Toolbox: Remove Samples logic. Install in root tools on new profiles.
 * UI: Added the "New Tab" command, this shows the quick start page whenever you open a new tab.
 * UI: Breadcrumbs have been made to use up slightly less space in the statusbar.
 * UI: Don't show file path for certain views fixes [#686](https://github.com/Komodo/KomodoEdit/issues/686).
 * UI: Fix pixelated fonts in sidebars when using Komodo on OSX with a Retina screen.
 * UI: Linter: The syntax checker icon in the statusbar now shows you linting results when clicked.
 * UI: Linting: The syntax checking pane has been removed, the same functionality is now accessible from the statusbar.
 * UI: Notification design has been simplified (flat design, no gradients or shadows).
 * Workspace2: Offer to save new files if dirty.
 * codeintel: Automatically hide the completion list if its one completion has been typed - fixes [#656](https://github.com/Komodo/KomodoEdit/issues/656).
 * codeintel: Do not log errors when attempting to scan images - fixes [#602](https://github.com/Komodo/KomodoEdit/issues/602).
 * codeintel: Ensure OOP codeintel has access to user extensions' Python library paths - fixed [#598](https://github.com/Komodo/KomodoEdit/issues/598).
 * codeintel: Fixed Perl parser to handle nested ()'s in variable assignment - fixes [#633](https://github.com/Komodo/KomodoEdit/issues/633).
 * codeintel: Fixed a few Tcl bugs - fixes [#722](https://github.com/Komodo/KomodoEdit/issues/722).
 * codeintel: Fixed reading from rails.cix catalog - fixes [#537](https://github.com/Komodo/KomodoEdit/issues/537).
 * codeintel: Fixed some instances of PHP completion with `foreach` - fixes [#142](https://github.com/Komodo/KomodoEdit/issues/142).
 * codeintel: Fixed variable highlighting with UTF-8 characters in the document - fixes [#642](https://github.com/Komodo/KomodoEdit/issues/642).
 * codeintel: Gracefully handle more than two Python 3 syntax errors in code browser - fixes [#238](https://github.com/Komodo/KomodoEdit/issues/238).
 * codeintel: PHP: Handle cases when a variable has the same name as a builtin function - fixes [#123](https://github.com/Komodo/KomodoEdit/issues/123).
 * codeintel: PHP: Support PHP 7's grouped "use" declarations.
 * codeintel: PHP: Support PHP 7's new anonymous classes.
 * codeintel: Perl: Show 'logically defined or' parameters in calltip - fixes [#449](https://github.com/Komodo/KomodoEdit/issues/449).
 * coffeescript: Coffeescript has no block comment syntax - fixes [#567](https://github.com/Komodo/KomodoEdit/issues/567).
 * console: auto-complete: Disable caching. var objs don't update.
 * docker: Added missing 'LABEL' keyword.
 * drag and drop: Fixed file drag and drop onto quick launch view - fixes [#77](https://github.com/Komodo/KomodoEdit/issues/77).
 * editing: Added preference for wrapping selection with typed delimiter (enabled by default).
 * editing: Allow Ctrl or Alt key to toggle making rectangular selections with the mouse - #fixes 690.
 * editing: Fixed errors with 'cmd_delete' in non-editor view - fixes [#408](https://github.com/Komodo/KomodoEdit/issues/408).
 * editing: HTML/XML: Added ability to edit matching tag in place via multiple selection.
 * editor: Changed column selection modifier to be Alt on Linux.
 * find: Fixed incremental find skipping twice on OSX on Enter keypress - fixes [#130](https://github.com/Komodo/KomodoEdit/issues/130).
 * installer: Warn if GDK version 2.24 dependency is not met during Linux installation - fixes [#296](https://github.com/Komodo/KomodoEdit/issues/296).
 * keybindings: vi: Ensure the caret is scrolled into view after moving in visual mode - fixes [#436](https://github.com/Komodo/KomodoEdit/issues/436).
 * languages: Added support for Mustache.
 * languages: JavaScript: Enable ES6 backquoted string highlighting - fixes [#743](https://github.com/Komodo/KomodoEdit/issues/743).
 * languages: Lua: Updated keywords and added syntax highlighting for standard libraries.
 * languages: PHP: Highlight class and function identifiers.
 * languages: Python: Support new keywords in 3.5.
 * languages: R: Added syntax highlighting for R.
 * lint: Allow inline display of lint results.
 * lint: CoffeeScript: Upgraded CoffeeScript linter - fixes [#550](https://github.com/Komodo/KomodoEdit/issues/550).
 * lint: Fixed linting for Javascript macros - fixes [#381](https://github.com/Komodo/KomodoEdit/issues/381).
 * lint: JSON: Added dedicated JSON linter - fixes [#127](https://github.com/Komodo/KomodoEdit/issues/127).
 * open files: Handle URI-encoded '#' and ':' when opening files at line numbers - fixes [#314](https://github.com/Komodo/KomodoEdit/issues/314).
 * places: Do not show editing preferences in "File Preferences" dialog if the file is not open - fixes [#430](https://github.com/Komodo/KomodoEdit/issues/430).
 * places: Ensure places file filters are in sync with project file filters - fixes [#455](https://github.com/Komodo/KomodoEdit/issues/455).
 * python: Detect pyflakes properly in Python3.
 * scintilla: Fixed Markdown lexer to highlight italic, bold, etc. spans - fixes [#658](https://github.com/Komodo/KomodoEdit/issues/658).
 * scintilla: Ruby: Highlight keyword-style arguments correctly - fixes [#522](https://github.com/Komodo/KomodoEdit/issues/522).
 * scintilla: Swift: Initial Swift syntax-highlighting support.
 * spellcheck: Added new command to jump to the next misspelled word - fixes [#588](https://github.com/Komodo/KomodoEdit/issues/588).
 * spellcheck: Allow "Ignore" for words with no spelling suggestions - fixes [#493](https://github.com/Komodo/KomodoEdit/issues/493).
 * terminal: Do not auto-scroll terminal output if the scroll position is above the last line - fixes [#630](https://github.com/Komodo/KomodoEdit/issues/630).

### 9.2.1

 * Prefs: Added Vagrantfile file association.
 * Syntax Highlighting: Added Docker syntax highlighting.
 * Toolbox: fix issue preventing tools from saving - fixes [#504](https://github.com/Komodo/KomodoEdit/issues/504).
 * Collab: Improve contact request user experience.
 * Scintilla: Fixed crash caused by drag+drop on OSX - fixes [#371](https://github.com/Komodo/KomodoEdit/issues/371).
 * Go: Fix issue where interpreter would not be properly detected.
 * Python: Detect pyflakes properly in Python3.
 * Publishing: Fixed auto push not working when path has spaces - fixes [#505](https://github.com/Komodo/KomodoEdit/issues/505).
 * Commando: Fix issue where results would not update - fixes [#515](https://github.com/Komodo/KomodoEdit/issues/515).
 * Commando: Shell: Don't default to running in container commands in an external terminal.
 * Commando: Shell: Fix autocompletion triggering on partial matches.
 * OSX: Ensure Scintilla dialog views' text is visible.
 * Scintilla: Highlight JavaScript and CoffeeScript regex properly - fixes [#414](https://github.com/Komodo/KomodoEdit/issues/414).
 * CodeIntel: Fixed reading from rails.cix catalog - fixes [#537](https://github.com/Komodo/KomodoEdit/issues/537).
 * Keybindings: vi: Ensure the caret is scrolled into view after moving in visual mode - fixes [#436](https://github.com/Komodo/KomodoEdit/issues/436).
 * Lint: Fixed linting for Javascript macros - fixes [#381](https://github.com/Komodo/KomodoEdit/issues/381).
 * Scintilla: Ruby: Highlight keyword-style arguments correctly - fixes [#522](https://github.com/Komodo/KomodoEdit/issues/522).

### 9.2 

 * Abyss: The Abyss (dark) skin has been removed from Komodo. It is still available through the package installer, but it just isn't packaged with Komodo anymore.
 * codeintel: Fixed potential crashes when autocompleting with multiple selections - fixes [#106](https://github.com/Komodo/KomodoEdit/issues/106).
 * codeintel: PHP: correctly resolve methods returning "$this". -- [Thanks to wizza-smile](https://github.com/Komodo/KomodoEdit/pull/44)
 * codeintel: Improved code documentation tooltips for methods - fixes [#203](https://github.com/Komodo/KomodoEdit/issues/203) -- [Thanks to Defman](https://github.com/Komodo/KomodoEdit/pull/255)
 * Collab: Now works with track changes.
 * Collab: Overhauled the sidepane.
 * Collab: Added named caret "flags" for everyone editing a file, you can easily see who is editing what.
 * Color Schemes: Allow for indicators to be square boxes, making for crisper UI.
 * Commando: Commando (and its scopes) will now toggle when you press their "show" shortcuts - fixes [#413](https://github.com/Komodo/KomodoEdit/issues/413).
 * Commando: Fix abnormal CPU usage after opening Commando - fixes [#411](https://github.com/Komodo/KomodoEdit/issues/411).
 * Commando: Fix icons in commando being barely visible on dark backgrounds.
 * Commando: Fix issue where excludes would not work on Windows - fixes [#117](https://github.com/Komodo/KomodoEdit/issues/117).
 * Commando: Fix issue where history would not be cleared when switching between scopes.
 * Commando: Fix issue where package manager binary locations would not update instantly.
 * Commando: Fix issue where the tip would overlap the results.
 * Commando: Fixed issue where certain commands (eg. Preferences) could not be executed - fixes [#364](https://github.com/Komodo/KomodoEdit/issues/364).
 * Commando: Fixed issue where selecting "Open" from the expand menu would fail - fixes [#422](https://github.com/Komodo/KomodoEdit/issues/422) -- [Thanks to Defman](https://github.com/Komodo/KomodoEdit/pull/423)
 * Commando: Fixed showing scrollbar when none is needed.
 * Commando: OpenFiles: Open Files are now sorted entirely by their last access time.
 * Commando: Removed the Navigation > Go To .. Menu's, Commando now facilitates this easily by itself.
 * Commando: Significantly improved search responsiveness, especially on OSX.
 * Debugger: nodejs: Forward interpreter flags to debugger properly - fixes [#357](https://github.com/Komodo/KomodoEdit/issues/357).
 * Find: Don't throw exception when attempting a search on a non-editor view - fixes [#374](https://github.com/Komodo/KomodoEdit/issues/374).
 * Icons: Add missing return statements, fixes most errors regarding ko-icon - fixes [#19](https://github.com/Komodo/KomodoEdit/issues/19).
 * Keybindings: Don't need to restart unless there are multiple komodo windows - fixes [#336](https://github.com/Komodo/KomodoEdit/issues/336).
 * Keybindings: Removed default Commando Sections scope keybinding, it was already used - fixes [#206](https://github.com/Komodo/KomodoEdit/issues/206).
 * Other: Fix issue where some files would refuse to open - fixes [#217](https://github.com/Komodo/KomodoEdit/issues/217).
 * Preferences: Fixed issue where some preference buttons would appear as white blocks on dark skins - fixes [#379](https://github.com/Komodo/KomodoEdit/issues/379) -- [Thanks to Defman](https://github.com/Komodo/KomodoEdit/pull/428)
 * Publishing: failed when path had spaces.
 * Refactoring: Fix missing replace field - fixes [#242](https://github.com/Komodo/KomodoEdit/issues/242).
 * Remote Servers: not defined errors when trying to open a remote file - fixes [#369](https://github.com/Komodo/KomodoEdit/issues/369).
 * Reporting: Added background error reporting, only used when users opt-in to analytics.
 * Scimoz: Make indicators look crispy, no more fuzzy borders.
 * Scintilla: Added support for highlighting CoffeeScript instance properties.
 * SDK: Added "windows" SDK, which will provide quick access to different Komodo windows/panels/dialogs.
 * SDK: Added the "views" module, allowing easy access to the Komodo views.
 * SDK: Added the ko/locale SDK, allowing easy use of mozilla's "properties" bundles.
 * Skin: Make editor look more crisp when using dark scheme by removing borders around it.
 * Skinning: Fix white text on white background in shell output - fixes [#298](https://github.com/Komodo/KomodoEdit/issues/298).
 * Skinning: Make HUD buttons flat, NO gradients!.
 * Workspace2: Added manage workspace.

### 9.1 

 * Commando: Cache is not updated when a shorcut is added - fixes [#115](https://github.com/Komodo/KomodoEdit/issues/115).
 * Commando: Commando hangs when descriptions have complex values - fixes [#111](https://github.com/Komodo/KomodoEdit/issues/111).
 * Commando: Commando prompts are behind commando panel on OSX - fixes [#110](https://github.com/Komodo/KomodoEdit/issues/110).
 * Commando: Oversized menulist icon on HiDPI.
 * Commando: Reload sections scope when switching files - fixes [#114](https://github.com/Komodo/KomodoEdit/issues/114).
 * Commando: Stops functioning when result entry has special characters - fixes [#266](https://github.com/Komodo/KomodoEdit/issues/266).
 * Editor: XML Auto-indentation causes infinite loop in edge cases - fixes [#186](https://github.com/Komodo/KomodoEdit/issues/186).
 * Icons: Debug tab icon was oversized on HiDPI/Retina - fixes [#72](https://github.com/Komodo/KomodoEdit/issues/72).
 * Mac: Performance: Stop high CPU usage on Mac coming from scrollbar overlays. ([Bugzilla #106458](https://bugs.activestate.com/show_bug.cgi?id=))
 * Markdown viewer: Improved markdown button reliability.
 * Notify: Pressing cog hides notification when priority is NOW - fixes [#41](https://github.com/Komodo/KomodoEdit/issues/41).
 * Other: Add back in way of opening the "Sample Project" - fixes [#265](https://github.com/Komodo/KomodoEdit/issues/265).
 * Places: Duplicate contents when toggling a folder - fixes [#61](https://github.com/Komodo/KomodoEdit/issues/61).
 * Places: Update places when a project is saved - fixes [#129](https://github.com/Komodo/KomodoEdit/issues/129).
 * Run: Run command was not saving recent commands - fixes [#37](https://github.com/Komodo/KomodoEdit/issues/37).
 * SDK: Shell: Added the ability to show the output of a command in a HUD panel.
 * Skin: Komodo skin got reset to default each time a user upgraded - fixes [#215](https://github.com/Komodo/KomodoEdit/issues/215).
 * Trackchanges: Encoding issue on windows where characters end up garbled in the change dialog - fixes [#69](https://github.com/Komodo/KomodoEdit/issues/69).
 * UI: Bottom pane height did not persist properly across restart - fixes [#47](https://github.com/Komodo/KomodoEdit/issues/47).
 * UI: High CPU use on OSX when using Trackpad - fixes [#99](https://github.com/Komodo/KomodoEdit/issues/99).
 * UI: Places widget dropdown menu had uppercase text - fixes [#46](https://github.com/Komodo/KomodoEdit/issues/46).
 * UI: fixed OSX Yosemite vibrancy effect in panes.
 * Debugger: Required two attempts to start debugging.
 * Code Intelligence: Fix race condition when multiple windows opened at startup - fixes [#171](https://github.com/Komodo/KomodoEdit/issues/171).
 * Debugger: Ensure Ctrl+F5 to skip debugger dialog works - fixes [#149](https://github.com/Komodo/KomodoEdit/issues/149).
 * Codeintel: allow go-lang prefs to pass to out-of-process codeintel - fixes [#58](https://github.com/Komodo/KomodoEdit/issues/58).
 * Tcl: autocomplete insertion was incorrect for unicode - fixes [#85](https://github.com/Komodo/KomodoEdit/issues/85).

### 9.0.1 

*   Abyss: Fixed issues on Windows with double borders and white space above toolbar.
*   Color Schemes: Use foreground color for caret color - fixes #75\. (Bug [issue #75](https://github.com/Komodo/KomodoEdit/issues/75))
*   Commando: Cache is not updated when a shorcut is added - fixes #115\. (Bug [issue #115](https://github.com/Komodo/KomodoEdit/issues/115))
*   Commando: Commando hangs when descriptions have complex values - fixes #111\. (Bug [issue #111](https://github.com/Komodo/KomodoEdit/issues/111))
*   Commando: Commando prompts are behind commando panel on OSX - fixes #110\. (Bug [issue #110](https://github.com/Komodo/KomodoEdit/issues/110))
*   Commando: Oversized menulist icon on HiDPI.
*   Commando: Reload sections scope when switching files - fixes #114\. (Bug [issue #114](https://github.com/Komodo/KomodoEdit/issues/114))
*   Editor: XML Auto-indentation causes infinite loop in edge cases - fixes #186\. (Bug [issue #186](https://github.com/Komodo/KomodoEdit/issues/186))
*   Icons: Debug tab icon was oversized on HiDPI/Retina - fixes #72\. (Bug [issue #72](https://github.com/Komodo/KomodoEdit/issues/72))
*   Notify: Pressing cog hides notification when priority is NOW - fixes #41\. (Bug [issue #41](https://github.com/Komodo/KomodoEdit/issues/41))
*   Places: Duplicate contents when toggling a folder - fixes #61\. (Bug [issue #61](https://github.com/Komodo/KomodoEdit/issues/61))
*   Places: Update places when a project is saved - fixes #129\. (Bug [issue #129](https://github.com/Komodo/KomodoEdit/issues/129))
*   Printing: Use the global ko object - fixes #74 & fixes #135\. (Bug [issue #74](https://github.com/Komodo/KomodoEdit/issues/74))
*   Run: Run command was not saving recent commands - fixes #37\. (Bug [issue #37](https://github.com/Komodo/KomodoEdit/issues/37))
*   Trackchanges: Encoding issue on windows where characters end up garbled in the change dialog - fixes #69\. (Bug [issue #69](https://github.com/Komodo/KomodoEdit/issues/69))
*   UI: Bottom pane height did not persist properly across restart - fixes #47\. (Bug [issue #47](https://github.com/Komodo/KomodoEdit/issues/47))
*   UI: High CPU use on OSX when using Trackpad - fixes #99\. (Bug [issue #99](https://github.com/Komodo/KomodoEdit/issues/99))
*   UI: Improve scrollbar contrast on dark color schemes.
*   UI: Places widget dropdown menu had uppercase text - fixes #46\. (Bug [issue #46](https://github.com/Komodo/KomodoEdit/issues/46))
*   UI: Ugly border showing around notifications on windows - fixes #108\. (Bug [issue #108](https://github.com/Komodo/KomodoEdit/issues/108))
*   UI: fixed OSX Yosemite vibrancy effect in panes.
*   fix Debugger: Required two attempts to start debugging.
*   fix issue #149 - Debugger: Ensure Ctrl+F5 to skip debugger dialog works. (Bug [issue #149](https://github.com/Komodo/KomodoEdit/issues/149))
*   fix issue #149 - Debugger: Ensure Ctrl+F5 to skip debugger dialog works. (Bug [issue #149](https://github.com/Komodo/KomodoEdit/issues/149))
*   fix issue #58 - codeintel: allow go-lang prefs to pass to out-of-process codeintel. (Bug [issue #58](https://github.com/Komodo/KomodoEdit/issues/58))
*   fix issue #85 - Tcl autocomplete insertion was incorrect for unicode. (Bug [issue #85](https://github.com/Komodo/KomodoEdit/issues/85))
*   fix issue 171: Code Intelligence: Fix race condition when multiple windows opened at startup.

### 9.0.0 

*   Editor: Stop scrolling jumps when word wrap is enabled and editor is resized. (Bug [106383](http://bugs.activestate.com/show_bug.cgi?id=106383))
*   Mac: Color Picker: Ensure the system color picker works correctly. (Bug [105463](http://bugs.activestate.com/show_bug.cgi?id=105463))
*   Mac: Ensure editor contents are shown after workspace restore. (Bug [105056](http://bugs.activestate.com/show_bug.cgi?id=105056))
*   Mac: Stop editor margin click from blocking the editor focus. (Bug [106378](http://bugs.activestate.com/show_bug.cgi?id=106378))
*   Projects: Ensure project restore loads the correct files. (Bug [106386](http://bugs.activestate.com/show_bug.cgi?id=106386))
*   Places: Ensure SCC status icon changes for edited files. (Bug [104886](http://bugs.activestate.com/show_bug.cgi?id=104886))

### 9.0.0c1 

*   Code Intelligence: PHP: Better scanning of if statements. (Bug [106103](http://bugs.activestate.com/show_bug.cgi?id=106103))
*   Color Schemes: Twilight_Dark was made the default color scheme.
*   Editor: Indentation: Stop strange characters when indenting unicode. (Bug [80493](http://bugs.activestate.com/show_bug.cgi?id=80493))
*   Mac: Editor: Stop editor region going blank in dialogs. (Bug [105056](http://bugs.activestate.com/show_bug.cgi?id=105056))
*   Mac: The UI for Komodo on OSX has been overhauled to fit the latest OSX release (Yosemite).
*   Preferences: Project preference categories should not be sortable. (Bug [106013](http://bugs.activestate.com/show_bug.cgi?id=106013))
*   Run Commands: Ensure output text is correctly colored. (Bug [105933](http://bugs.activestate.com/show_bug.cgi?id=105933))
*   Startup: Show "Getting Started" dialog on upgrades. (Bug [106007](http://bugs.activestate.com/show_bug.cgi?id=106007))
*   File Paths: Collapse double-root "//" paths on Unix. (Bug [106180](http://bugs.activestate.com/show_bug.cgi?id=106180))

### 9.0.0b1 

*   Check Configuration: Ensure Git, hg and bzr show the correct status. (Bug [97855](http://bugs.activestate.com/show_bug.cgi?id=97855))
*   Code Intelligence: CSS: Show pseudo completions after ":". (Bug [104799](http://bugs.activestate.com/show_bug.cgi?id=104799))
*   Code Intelligence: PHP: Better detection of foreach variables. (Bug [100701](http://bugs.activestate.com/show_bug.cgi?id=100701))
*   Code Intelligence: Perl: Add variable completions on "$". (Bug [105007](http://bugs.activestate.com/show_bug.cgi?id=105007))
*   Code Intelligence: Perl: Correct parsing of perl assignment expressions. (Bug [105308](http://bugs.activestate.com/show_bug.cgi?id=105308))
*   Debugging: Node.js: Ensure stderr messages are relayed to Komodo. (Bug [105402](http://bugs.activestate.com/show_bug.cgi?id=105402))
*   Debugging: Perl: Fix mod_perl from skipping breakpoints. (Bug [105124](http://bugs.activestate.com/show_bug.cgi?id=105124))
*   Debugging: Tcl: Update appLaunch.tcl file. (Bug [101199](http://bugs.activestate.com/show_bug.cgi?id=101199))
*   Debugging: XSLT: Linux: Update binary for Linux x86 compatibility. (Bug [105706](http://bugs.activestate.com/show_bug.cgi?id=105706))
*   Editor: Django: Update list of django tags and filter names. (Bug [104511](http://bugs.activestate.com/show_bug.cgi?id=104511))
*   Editor: Ensure goto line focuses the editor. (Bug [104827](http://bugs.activestate.com/show_bug.cgi?id=104827))
*   Editor: Ensure tooltip positions are correct on high DPI monitors. (Bug [104640](http://bugs.activestate.com/show_bug.cgi?id=104640))
*   Editor: Indentation: Catch when indentation is set to zero. (Bug [105905](http://bugs.activestate.com/show_bug.cgi?id=105905))
*   Find and Replace: Ensure find markers are not added more than once. (Bug [104553](http://bugs.activestate.com/show_bug.cgi?id=104553))
*   Find and Replace: Handle unicode replacement correctly. (Bug [105541](http://bugs.activestate.com/show_bug.cgi?id=105541))
*   Find and Replace: Mac: Show marked changes should not stop mouse. (Bug [93333](http://bugs.activestate.com/show_bug.cgi?id=93333))
*   Installer: Linux: Use xdg-desktop scripts to install menu and icon. (Bug [101857](http://bugs.activestate.com/show_bug.cgi?id=101857))
*   Keybindings: Emacs: Ensure Ctrl+K (cut to end of line) works correctly. (Bug [105506](http://bugs.activestate.com/show_bug.cgi?id=105506))
*   Keybindings: Vi: Ensure line up/down commands work in line wrap mode. (Bug [87356](http://bugs.activestate.com/show_bug.cgi?id=87356))
*   Preferences: Added prefs to control HTML matching tag highlighting. (Bug [95667](http://bugs.activestate.com/show_bug.cgi?id=95667))
*   Preferences: Better handling for corrupted pref files. (Bug [105385](http://bugs.activestate.com/show_bug.cgi?id=105385))
*   Preferences: Default file encoding is now UTF-8. (Bug [90424](http://bugs.activestate.com/show_bug.cgi?id=90424))
*   Preferences: Ensure formatter preference sets are saved correctly. (Bug [105850](http://bugs.activestate.com/show_bug.cgi?id=105850))
*   Project Templates: Ensure prefs are saved as part of the template. (Bug [104535](http://bugs.activestate.com/show_bug.cgi?id=104535))
*   Remote Files: Allow defining a SSH private key for SFTP/SCP connections. (Bug [67948](http://bugs.activestate.com/show_bug.cgi?id=67948))
*   SDK: Ensure koext startlang works with --is-html-based argument. (Bug [104551](http://bugs.activestate.com/show_bug.cgi?id=104551))
*   Startup: Linux: Ensure compatibility with different shell's. (Bug [105122](http://bugs.activestate.com/show_bug.cgi?id=105122))
*   Syntax Checking: Ensure working on latin-1 file encoding. (Bug [105635](http://bugs.activestate.com/show_bug.cgi?id=105635))
*   Syntax Checking: Tcl: Correct variable scope check inside try block. (Bug [101049](http://bugs.activestate.com/show_bug.cgi?id=101049))
*   Syntax Checking: Tcl: Pass version to syntax checking validator. (Bug [103533](http://bugs.activestate.com/show_bug.cgi?id=103533))

### 9.0.0a1 

*   Code Formatting: Html formatters now default to utf8 encoding. (Bug [102922](http://bugs.activestate.com/show_bug.cgi?id=102922))
*   Code Intelligence: Create seperate preferences for showing completions, calltips. (Bug [68533](http://bugs.activestate.com/show_bug.cgi?id=68533))
*   Code Intelligence: Detect out-of-memory errors and restart the process. (Bug [103067](http://bugs.activestate.com/show_bug.cgi?id=103067))
*   Code Intelligence: Fix memory leak in PHP file scanning. (Bug [102643](http://bugs.activestate.com/show_bug.cgi?id=102643))
*   Code Intelligence: JavaScript: Ensure document completions work inside of HTML. (Bug [102993](http://bugs.activestate.com/show_bug.cgi?id=102993))
*   Code Intelligence: PHP: Fix return type for PDO::prepare(). (Bug [103603](http://bugs.activestate.com/show_bug.cgi?id=103603))
*   Debugger: Add a command to start debugging, but skipping the options dialog. (Bug [103724](http://bugs.activestate.com/show_bug.cgi?id=103724))
*   Debugger: Ignore breakpoint margin clicks when the language is not debuggable. (Bug [97200](http://bugs.activestate.com/show_bug.cgi?id=97200))
*   Debugger: Python 3: Ensure debugging can work on Python 3.4. (Bug [103631](http://bugs.activestate.com/show_bug.cgi?id=103631))
*   Editor: Automatically enable word-wrap when a file has long lines. (Bug [93790](http://bugs.activestate.com/show_bug.cgi?id=93790))
*   Editor: Fix transpose-words so it works more like in Emacs. (Bug [73994](http://bugs.activestate.com/show_bug.cgi?id=73994))
*   Editor: Fix transposeCharacters command, add tests. (Bug [73992](http://bugs.activestate.com/show_bug.cgi?id=73992))
*   Editor: Highlight 'elif' tag in Django, 'elseif' in Twig (and improve auto-indent). (Bug [101792](http://bugs.activestate.com/show_bug.cgi?id=101792))
*   Editor: Make Transpose-characters work the same way Emacs does. (Bug [73992](http://bugs.activestate.com/show_bug.cgi?id=73992))
*   Editor: When changing case in column selection, stay in column selection. (Bug [100269](http://bugs.activestate.com/show_bug.cgi?id=100269))
*   Editor: when moving to or opening a file at a particular location, make sure the caret/selection is visible. (Bug [98866](http://bugs.activestate.com/show_bug.cgi?id=98866))
*   Find: Add ability to copy the results to the clipboard. (Bug [91733](http://bugs.activestate.com/show_bug.cgi?id=91733))
*   Find: For replace, always populate the replace textbox with the last replace text. (Bug [91177](http://bugs.activestate.com/show_bug.cgi?id=91177))
*   Find: Stop find options from changing when using multi caret commands. (Bug [103329](http://bugs.activestate.com/show_bug.cgi?id=103329))
*   Find: Use last searched pattern, never populate with the word under cursor. (Bug [91177](http://bugs.activestate.com/show_bug.cgi?id=91177))
*   Hyperlinks: Ensure Komodo can display hyperlinks where titles contain html-sensitive characters. (Bug [102098](http://bugs.activestate.com/show_bug.cgi?id=102098))
*   Keybindings: Vi: Added scroll commands zz z. and z-. (Bug [69495](http://bugs.activestate.com/show_bug.cgi?id=69495))
*   Keybindings: Vi: Ensure jump to matching brace works like vi does. (Bug [104053](http://bugs.activestate.com/show_bug.cgi?id=104053))
*   Languages: Add CMake as a recognized language. (Bug [102854](http://bugs.activestate.com/show_bug.cgi?id=102854))
*   Perl lexing: recognize that {...} after '&amp;' is a named func, not a block. (Bug [101817](http://bugs.activestate.com/show_bug.cgi?id=101817))
*   Places: After creating a new file, open it and display it in places. (Bug [94287](http://bugs.activestate.com/show_bug.cgi?id=94287))
*   Places: Cull deleted items in placesParentDirectoriesMenu. (Bug [98684](http://bugs.activestate.com/show_bug.cgi?id=98684))
*   Prefs: Make sure the search box can be used to select primary languages. (Bug [102207](http://bugs.activestate.com/show_bug.cgi?id=102207))
*   Projects: When opening a new project is aborted, keep the old project on the MRU list. (Bug [94201](http://bugs.activestate.com/show_bug.cgi?id=94201))
*   Source Code Control: Checkout now allows "~" home directory based paths. (Bug [103575](http://bugs.activestate.com/show_bug.cgi?id=103575))
*   Source Code Control: Checkout: Remember the checkout textbox url. (Bug [99395](http://bugs.activestate.com/show_bug.cgi?id=99395))
*   Source Code Control: Git: Ensure git submodules are properly detected in commit dialog. (Bug [95701](http://bugs.activestate.com/show_bug.cgi?id=95701))
*   Syntax Checking: Python: Tell pylint where to find .pylintrc. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*   Syntax Checking: Python: Reinstate passing --rcfile to pylint, and add tests to verify it works. (Bug [101777](http://bugs.activestate.com/show_bug.cgi?id=101777))
*   Toolbox: Stop duplication of snippets when dropping snippet text. (Bug [103113](http://bugs.activestate.com/show_bug.cgi?id=103113))
*   UI: Side Panes: Re-enable word-wrap in output panels (command output, debugger output). (Bug [98471](http://bugs.activestate.com/show_bug.cgi?id=98471))
*   UI: Statusbar: Hide the encoding widget when it's not applicable. (Bug [102565](http://bugs.activestate.com/show_bug.cgi?id=102565))

<a name="knownissues"></a>
## Known Issues

To view the status of outstanding Komodo issues,
including those that have been fixed in this release, or to
add comments or additional issues, please visit the
[Komodo
Bug Database](http://bugs.activestate.com/query.cgi?product=Komodo).

### <a name="install_issues" id="install_issues">Installation &amp; Upgrade</a>

*   The Komodo installer requires up to 300 MB in your
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

*   Slow startup may occur if the PATH environment contains networked drives
  - [bug 103996](https://bugs.activestate.com/show_bug.cgi?id=103996).
*   Slow performance on NoMachine (remote desktop) has been
  reported - [bug 93841](http://bugs.activestate.com/show_bug.cgi?id=93841).
*   On Windows, _Direct Folders_ application can cause shutdown hangs
- [bug 101357](http://bugs.activestate.com/show_bug.cgi?id=101357).

### <a name="Editing_Issues" id="Editing_Issues">Editing</a>

*   By design, Komodo does not attempt Replace in Files operations on
  unknown file types. However, file association preferences can be used
  to associate a user-defined extension with a language category (e.g.
  "Text") which then enables replacements for that file type.
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
  Preferences](../prefs.html#prefs_editor) to disable this feature. (Bug [18297](http://bugs.activestate.com/show_bug.cgi?id=18297))
*   On Linux, GTK2 hard codes 'Ctrl'+'Shift' to use
  international input. Therefore, all key bindings
  involving 'Ctrl'+'Shift'+ (any valid hexadecimal
  character) do not work in Komodo. A workaround is to
  start Komodo with the command: `export
  GTK_IM_MODULE=xim; ./komodo'`. Otherwise, key
  bindings of this kind must be changed. (Bug [38205](http://bugs.activestate.com/show_bug.cgi?id=38205))
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
*   The Perl debugger uses `alarm()`
  internally. This can conflict with some Perl frameworks
  and modules (such as <acronym title=
  "Perl Object Environment">POE</acronym>) which use
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
*   When debugging remote applications, Komodo may fail if
  the remote process does not have valid stdout and stderr
  handles. GUI applications, such as those started with
  "wperl.exe" or "pythonw.exe", or those using the
  Pythonwin or wxPython frameworks, or those with certain
  embedded applications, can have invalid stdout and stderr
  handles. Until we resolve this issue, try to run and
  debug your remote program under perl.exe or
  python.exe.
*   Komodo debugging requires TCP/IP to be enabled, even if
  you are debugging scripts locally. TCP/IP is enabled by
  default on most systems. On systems with firewalls installed,
  the debugger may fail if the firewall is not configured to
  allow Komodo to listen for connections. On Windows, you
  may see a "Windows Security Alert" dialog asking if you
  want to allow Komodo to listen for connections, you will
  need to unblock Komodo. (Bug [21684](http://bugs.activestate.com/show_bug.cgi?id=21684))
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
  interactive shell so getpass will issue a warning.
  (Bug [34259](http://bugs.activestate.com/show_bug.cgi?id=34259))

### <a name="Source_Code_Control_Issues" id="Source_Code_Control_Issues">Source Code Control</a>

*   The SCC Checkout wizard, SCC Commit and SCC Push features does not
  correctly handle password authentication. SCC commands requiring password
  authentication should be done at the command line, or be setup to use
  password-less authentication mechanisms.
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
  may hang the Komodo Source Code Control system. (Bug [35058](http://bugs.activestate.com/show_bug.cgi?id=35058))
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
*   Display of text during editing ("painting") may
  sometimes be slow or pause momentarily.
*   Certain UI elements stop working after changing key
  bindings. Restarting Komodo fixes this. (Bug [38683](http://bugs.activestate.com/show_bug.cgi?id=38683))
*   When saving a file, Komodo does not set file
  information (type and creator) for the OS X Finder to
  know that Komodo created the file. (Bug [38745](http://bugs.activestate.com/show_bug.cgi?id=38745))
*   Breakpoints cannot be removed when debugging XSLT
  scripts. (Bug [40072](http://bugs.activestate.com/show_bug.cgi?id=40072))
*   PHP debugging may not work with the PHP build
  distributed with OS X because it does not load external
  modules. To use PHP debugging on OS X, build PHP from
  source or download a binary from [http://www.entropy.ch/software/macosx/php](http://www.entropy.ch/software/macosx/php)

  (Bug [39901](http://bugs.activestate.com/show_bug.cgi?id=39901))
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
*   Key bindings defined in the window manager (such as
  KDE) take precedence over Komodo key bindings. In the
  case of conflicts, you must either change the Komodo key
  bindings or the window manager key bindings. (Bug
  30926)
*   You cannot move an existing Komodo installation to a
  new directory. You must uninstall Komodo from the
  existing location and reinstall it in the new location.
  (Bug [19478](http://bugs.activestate.com/show_bug.cgi?id=19478))
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

*   On Windows, some interactive commands may not work
  properly when run from the **Command
  Output** tab of the Output Pane. You must run
  these commands in a separate shell. (Bug [23176](http://bugs.activestate.com/show_bug.cgi?id=23176))
*   Macros will not record certain commands, including
  (but possibly not limited to)
  'Ctrl'+'Shift'+'B'|'R'|'E'|'D' (toggle toolbars or button
  text), 'Ctrl'+'Shift'+'N' (new default file), and View as
  Language menu items.
*   When you schedule a new file to be added using CVS,
  CVS will not permit you to remove the file from the
  repository using the "revert changes" command. (Bug
  27192)
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
