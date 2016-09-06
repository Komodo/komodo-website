---
title: Komodo 10 Changelog
sidebar: download
classNames: small-text markdown
---

# Komodo IDE/Edit 10 Release Notes

These Release Notes cover [what's new](#whatsnew), [detailed changes and bug fixes](#details) and [known issues](#knownissues) for Komodo IDE and Komodo Edit.

<a name="whatsnew"></a>
## What's New in Komodo IDE/Edit

### 10.1.1

 [See below](#details)

### 10.1.0

 * **Tutorial Tool (IDE only):**
    Write and use tutorials that will run in Komodo. We are using this mechanic
    ourselves with the introduction of some useful "getting started" tutorials.
    The possiblities here are endless, you could learn how to program in a new
    language or framework completely from Komodo, or use it as an educational
    tool for the classroom. We're excited to see where the community will take
    this. Tutorials can be accessed via your Toolbox.
    
 * **Publishing Improvements (IDE only):**
    You can now force push and force pull files, which is incredibly useful for
    workflows where all you ever do is upload changes. Additionally we're
    introducing a dynamic toolbar button for Publishing actions, letting you
    quickly access common publishing tasks.
    
 * **Language Updates:**
    We've added support for Mustache templating as well as support for syntax
    checking in Angular files. Additionally our Gulp integration has been
    extended to support Gulp.babel tasks.
    
 * **Other Mentionables:**
    * Support for Mustache templating
    * Syntax checking for Angular.js HTML
    * VSCode Keybinding set (for converts)
    * Force push and force pull support for Publishing
    * New dynamic button for Publishing
    * New branch switching statusbar widget for Git and Mercurial
    * Various improvements to the commit dialog
    * Support for gulp.babel in our gulp integration
    * Global font settings
    * Improved user experience for the color scheme editor
    * Better HiDPI support for Linux
    * New preference to open find results in file tabs
    * Added missing Laravel Blade directives (thanks to lagbox!)
    * Added RGBA support to our color picker (thanks to Defman!)
    * Improved multi-caret behavior
    * Various codeintel improvements
    * More performance improvements
    * Improved multi-window stability
    * And tons more ([See below](#details))


### 10.0.1

 [See below](#details)

### 10.0

* **New User Interface**:
    The entire user interface has been given a big facelift. This facelift isn't
    just about making Komodo more attractive and enjoyable to use; a ton of user
    experience work has gone into the facelift. On the technical end, these
    changes make Komodo far more maintainable and far less prone to interface
    related bugs. Possibly the biggest feature, though, is that you can define
    your own colors. Every color scheme now also extends to the user interface,
    so you can tweak and style not just how your code looks, but also how Komodo
    looks. Or not--it's entirely up to you, of course.
    
    For those who prefer not to have their user interface change too much we've
    also introduced some preferences which let you essentially use the "classic"
    approach to UI in many places.
    
    These changes do mean that skins and iconsets for Komodo 8 and 9 will no
    longer work.
    
* **The Dynamic Toolbar**:
    The dynamic toolbar is a new UI element in Komodo 10 which holds toolbar
    buttons that provide contextual actions to your files and project. They
    show and hide based on what you're doing and provide information and actions
    based on how your files and projects are configured. For example the version
    control dynamic button will show you how many files have changed and allow
    you to quickly open eg. file or project history, or the commit dialog.
    
    The dynamic toolbar is very developer friendly, so you can easily create
    your own buttons or download ones that were contributed by other developers.
    
* **First Start Wizard**:
    When you first start Komodo (or when you update between major versions)
    Komodo will now show you a short and simple first start wizard that lets you
    customize Komodo to your likings. Tabs or spaces? The bias is all yours.
    
* **New Default Keybindings**:
    Our old defaults (which are still available as "Legacy" keybindings) were an
    accumulation of 10+ years of changes. Needless to say they became messy and
    illogical. With Komodo 10 we dumped them entirely and started from scratch.
    A rule of thumb here was that if something didn't make sense then it didn't
    deserve a default binding, the user can define these themselves. We also
    reviewed other editors complete default keybinding sets to find
    commonalities in the industry. The new bindings are based on logic and
    sensible defaults that programmers have become accustomed to.
    
* **Other Editor Keybindings**:
    We are introducing keybindings for other editors and IDE's to facilitate
    developers transitioning to Komodo. These can be accessed from your Keybinding
    preferences or via the First Start wizard.

* **Chrome Remote Debugging (IDE only)**:
    Debug your code in Chrome, from Komodo! No more context switching or
    locating the same code you've been working on again in the Chrome dev tools.
    You can write code, place breakpoints and debug all right from inside
    Komodo.
    
* **Debugging for Ruby 2.1 And Beyond (IDE only)**:
    Due to the library that Komodo was depending on for Ruby debugging no longer
    working in Ruby version 2.1 and beyond we have not been able to properly
    support those versions for a while now. With Komodo 10 that changes, we've
    been hard at work at Ruby 2.1+ support and are confident in introducing it
    with Komodo 10. This also includes Ruby 2.1+ REPL support.
    
* **Gulp, Grunt, NPM task runner Integration (IDE only)**:
    Komodo now integrates with Gulp, Grunt and NPM tasks. The
    integration allows you to run commands for those task runners in your shell
    scope (inside Commando), it also adds a button to your dynamic toolbar (new in
    Komodo 10) which lets you quickly run commands via those task runners. This
    button is only visible when your project uses one of these tools. So for
    example, if you have a Gulp task called "Concatenate" you can just hit the
    Gulp button and hit "Concatenate".
    
* **PhoneGap & Cordova Integration (IDE only)**:
    Quickly access PhoneGap and Cordova via your "dynamic toolbar", as well
    as interact with them via the Commando shell scope. Komodo automatically
    detects your configuration and provides contextual actions.
    
* **Symbol Browser (IDE only)**:
    The section scope (inside Commando) now allows you to browse symbols across
    your entire project. So you can easily jump to classes, functions,
    properties, or other symbols no matter where they are in your project.
    
* **Improved Node.js and PHP CodeIntel**:
    JavaScript and PHP CodeIntel has had significant improvements, NodeJS modules
    and PSR4 classes are fully supported as well as various new features of each
    language.
    
* **Support For React, Ember, Angular, TypeScript, ES6**:
    We've put a lot of focus on individual frameworks in Komodo 10, a trend you
    can expect to continue. With this iteration we focused on some of the most
    popular JS frameworks and derivatives.
    
* **Performance Improvements**:
    Komodo 10 has received significant performance improvements. File opening,
    closing, saving, typing, .. you name it. Additionally we've fixed a long
    standing memory leak which caused users to have to restart Komodo every few
    days, that should no longer be the case.

* **Other Mentionables**

* Entire UI is now skinnable using the color scheme editor
* Improved source code control UI and UX (IDE only)
* New SCC Commit Dialog (IDE only)
* New SCC Widget (IDE only)
* Improved unit testing UI and UX (IDE only)
* Improved color picker UI and UX
* New color scheme editor
* New UI SDK (used in our new [First Start Wizard](https://github.com/Komodo/KomodoEdit/blob/10.0.0-alpha1/src/chrome/komodo/content/startupWizard/startupWizard.js#L53))
* and much much more ([See below](#details)) ..

<a name="details"></a>

## Detailed Changes and Bug Fixes in Komodo IDE/Edit

Changes related to Debugging, Interactive Shells, Source Code
Control, HTTP Inspector, Rx Toolkit, Code Browser, Database Explorer
and the Sections List only apply to Komodo IDE only.

### 10.1.1

*   Colors: Fix side toolbar icon color not respecting color pref - fixes [#1962](https://github.com/Komodo/KomodoEdit/issues/1962).
*   Elastic tabstops: Fix elastic tabstops no longer being packaged with Komodo - fixes [#1989](https://github.com/Komodo/KomodoEdit/issues/1989).
*   Find: Fix "Find All" from failing - fixes [#1964](https://github.com/Komodo/KomodoEdit/issues/1964).
*   Linting: AngularJS: Show HTML warnings when requested - fixes [#1952](https://github.com/Komodo/KomodoEdit/issues/1952).
*   Logging: Increase robustness of error logging - possible fix for random crashes [#1007](https://github.com/Komodo/KomodoEdit/issues/1007).
*   PDK/TDK: fix toolbar button not showing, fixes [#1956](https://github.com/Komodo/KomodoEdit/issues/1956).
*   SCC: Fix history widget not automatically updating.
*   Tutorials: Close callout if window is moved/resized - fixes [#1979](https://github.com/Komodo/KomodoEdit/issues/1979).
*   Tutorials: Fix tutorial window undocking when another window is opened - fixes [#1971](https://github.com/Komodo/KomodoEdit/issues/1971).
*   Tutorials: Fix window resizing when tutorial is opened.
*   Tutorials: Fix wrong indentation in properties dialog - fixes [#1982](https://github.com/Komodo/KomodoEdit/issues/1982).
*   UI: Notification pane toggle buttons don't reflex state - fixes [#1965](https://github.com/Komodo/KomodoEdit/issues/1965).

### 10.1.0

*   Analytics: Analytics are now opt-out instead of opt-in.
*   Analytics: Track what features are popular by recording clicks on widgets and side toolbar buttons (only tracks the click, nothing else).
*   Codeintel: Add ability to exclude folders from codeintel scans - fixes [#195](https://github.com/Komodo/KomodoEdit/issues/195).
*   Codeintel: Auto-restart if the process exits for any reason - fixes [#1350](https://github.com/Komodo/KomodoEdit/issues/1350).
*   Codeintel: JavaScript: Export members as variables to prior scopes in anonymous function calls - fixes [#1144](https://github.com/Komodo/KomodoEdit/issues/1144).
*   Codeintel: Less: Better disambiguation of properties vs. nested selectors - fixes [#1370](https://github.com/Komodo/KomodoEdit/issues/1370).
*   Codeintel: Normalize paths before storing them in the database - fixes [#1644](https://github.com/Komodo/KomodoEdit/issues/1644).
*   Codeintel: Perl: Fixed goto-definition for various dereferences - fixes [#1514](https://github.com/Komodo/KomodoEdit/issues/1514).
*   Codeintel: PHP: Actually ignore functions tagged with "@ignore" from being hits - fixes [#1672](https://github.com/Komodo/KomodoEdit/issues/1672).
*   Codeintel: PHP: Fixed error showing inherited method calltips - fixes [#1638](https://github.com/Komodo/KomodoEdit/issues/1638).
*   Codeintel: Ruby: Fixed stdlib generation to include left-out methods - fixes [#1389](https://github.com/Komodo/KomodoEdit/issues/1389).
*   Codeintel: SCSS: Added SCSS-specific at rules (Sass too) - fixes [#1668](https://github.com/Komodo/KomodoEdit/issues/1668).
*   ColorSchemes: Classic: Fix menupopup color not contrasting - fixes [#1930](https://github.com/Komodo/KomodoEdit/issues/1930).
*   Console: You can now select a different context by typing /windows.
*   CVS: Fix issue where status results were not making it into Komodo.
*   Dbgp: Chrome: Fixed display of global variables and correctly watch closure variables - fixes [#1796](https://github.com/Komodo/KomodoEdit/issues/1796).
*   Dbgp: Chrome: Fixed expanding multiple nested levels of objects in variables view - fixes [#1794](https://github.com/Komodo/KomodoEdit/issues/1794).
*   Dbgp: Chrome: Support expressions for "property_get" along with unit tests - fixes [#1785](https://github.com/Komodo/KomodoEdit/issues/1785).
*   Debug: Ruby: Do not save "./.byebug_history" files in the cwd - fixes [#1454](https://github.com/Komodo/KomodoEdit/issues/1454).
*   Debug: Ruby: Redirected STDOUT plays nicely with libraries - fixes [#1453](https://github.com/Komodo/KomodoEdit/issues/1453).
*   Django: Fix linting when DJANGO_SETTINGS_MODULE env variable exists - fixes [#1646](https://github.com/Komodo/KomodoEdit/issues/1646).
*   Editing: Indent: Added new smart indent option to not line up continuing statements - fixes [#1427](https://github.com/Komodo/KomodoEdit/issues/1427).
*   Editor: Added "wrap selection with multiple carets" command - fixes [#1780](https://github.com/Komodo/KomodoEdit/issues/1780).
*   Editor: Added commands for remaining on the current line when moving/selecting by words/word parts - fixes [#1219](https://github.com/Komodo/KomodoEdit/issues/1219).
*   Editor: Added in-line selection duplicate left/right commands.
*   Editor: Added new command to add next word or substring to the caret set - fixes [#1131](https://github.com/Komodo/KomodoEdit/issues/1131).
*   Editor: Allow color hyperlinks from any language (excluding color constants).
*   Editor: Be more consistent when adding words or substrings to the caret set - fixes [#1903](https://github.com/Komodo/KomodoEdit/issues/1903).
*   Editor: Do not show "go to definition" hyperlinks in comments and strings - fixes [#1869](https://github.com/Komodo/KomodoEdit/issues/1869).
*   Editor: Fix color hyperlinks not working after initial use - fixes [#1876](https://github.com/Komodo/KomodoEdit/issues/1876).
*   Editor: Fixed issue where history back/forward stopped working (stopped recording).
*   Editor: indent: Added commands for indent/dedent that always work on single lines - fixes [#1323](https://github.com/Komodo/KomodoEdit/issues/1323).
*   Editor: indent: Do not dedent by tab width if space indentation is used - fixes [#1744](https://github.com/Komodo/KomodoEdit/issues/1744).
*   Editor: multi caret selection supports substring fixes [#1904](https://github.com/Komodo/KomodoEdit/issues/1904).
*   Editor: Multiple select add next word works with non-word selections now - fixes [#1558](https://github.com/Komodo/KomodoEdit/issues/1558).
*   Editor: Refactored line/selection duplicate up/down to handle selections correctly - fixes [#1353](https://github.com/Komodo/KomodoEdit/issues/1353).
*   Editor: Show CSS color picker in Sass files - fixes [#1815](https://github.com/Komodo/KomodoEdit/issues/1815).
*   Find: You can now choose to have find results open in file tabs (instead of bottom panel).
*   Gulp: Added support for gulp.babel.
*   Icons: Don't render two reload icons.
*   Keybindings: Allow Shift+backspace fixes [#1723](https://github.com/Komodo/KomodoEdit/issues/1723).
*   Keybindings: word select incorrect key binding.
*   Lang: Initial support for Handlebars - fixes [#1449](https://github.com/Komodo/KomodoEdit/issues/1449).
*   Lang: PHP: Fixed syntax highlighting of short PHP tags in HTML strings - fixes [#1773](https://github.com/Komodo/KomodoEdit/issues/1773).
*   Languages: Associate `*.mustache` files with Mustache language - fixes [#1432](https://github.com/Komodo/KomodoEdit/issues/1432).
*   Languages: Associate `*.ru` files with Ruby - fixes [#1435](https://github.com/Komodo/KomodoEdit/issues/1435).
*   Languages: New Laravel Blade directives from lagbox.
*   Lint: AngularJS: Lint AngularJS as HTML5 - fixes [#1448](https://github.com/Komodo/KomodoEdit/issues/1448).
*   Lint: HTML5: Do not force HTML(4) checking on XHTML5 documents - fixes [#944](https://github.com/Komodo/KomodoEdit/issues/944).
*   Lint: JavaScript: Do not report unused variables twice - fixes [#1725](https://github.com/Komodo/KomodoEdit/issues/1725).
*   Lint: JavaScript: Respect JSHint linting preference - fixes [#1701](https://github.com/Komodo/KomodoEdit/issues/1701).
*   Lint: SASS: Fixed incorrect word for SASS linter popup - fixes [#1823](https://github.com/Komodo/KomodoEdit/issues/1823).
*   Lint: Sass: Properly recognize errors - fixes [#1821](https://github.com/Komodo/KomodoEdit/issues/1821).
*   Main:ask to save dirty files once, fixes [#1718](https://github.com/Komodo/KomodoEdit/issues/1718).
*   OSX: Ensure view is visible after un-hide - fixes [#564](https://github.com/Komodo/KomodoEdit/issues/564).
*   Other: Improve multi-window stability - fixes [#1695](https://github.com/Komodo/KomodoEdit/issues/1695).
*   Performance: Improve window activation detection, removing false positives.
*   PHP: Added hidden preference for PHP interpreter output timeout - fixes [#1684](https://github.com/Komodo/KomodoEdit/issues/1684).
*   Prefs: Fix help button link on project/file level prefs - fixes [#1838](https://github.com/Komodo/KomodoEdit/issues/1838).
*   Profile: Ignore errors when asked and the source directory does not exist.
*   Projects: Fixed project widget resizing not working to un-collapse - fixes [#1483](https://github.com/Komodo/KomodoEdit/issues/1483).
*   Pub dialog:Allow Force Push/Pull [#148](https://github.com/Komodo/KomodoEdit/issues/148).
*   Publishing: detect remote removed + local.edited conflict fixes [#1832](https://github.com/Komodo/KomodoEdit/issues/1832).
*   Publishing: Pull/Force enabled in Place [#148](https://github.com/Komodo/KomodoEdit/issues/148).
*   Publishing: Add dynamic button.
*   Publishing: force-pull/push-all in dialog w/warning.
*   Publishing: Force push from Places fixes [#148](https://github.com/Komodo/KomodoEdit/issues/148).
*   Publishing: skin publishing UI.
*   Rails: Fixed runtime errors in Rails userscripts - fixes [#1429](https://github.com/Komodo/KomodoEdit/issues/1429).
*   Ruby: Fixed lexing of numbers and ranges in Ruby - fixes [#1375](https://github.com/Komodo/KomodoEdit/issues/1375), 1410.
*   SCC: Added a new statusbar component for version control which shows the current branch and allows switching to other branches.
*   SCC: Commit: Fixed keyboard navigation.
*   SCC: Commit: Improve selection UX for the commit dialog.
*   SCC: Commit: Made commit textbox taller, making multi-line commits easier.
*   SCC: Commit: Made the selection panel resizable.
*   SCC: Commit: You can now once again commit files using just your keyboard.
*   SCC: Do not assume places selection as context for committing - fixes [#1757](https://github.com/Komodo/KomodoEdit/issues/1757).
*   SCC: Remove flickering from commit widget when saving files.
*   SCC: Version control is now contextual to the current file again.
*   SCC: Widget: Made the SCC widgets lazy - only reload if they are visible.
*   Scheme Editor: Fixed issue where it was impossible to read certain text - fixes [#1203](https://github.com/Komodo/KomodoEdit/issues/1203).
*   Scheme Editor: Improve naming of color scheme properties, making them easier to understand - fixes [#1490](https://github.com/Komodo/KomodoEdit/issues/1490).
*   Schemes: Adding VSCode key binding scheme.
*   Scintilla: Do not re-scale mouse dwell xy coordinates on Linux - fixes [#1811](https://github.com/Komodo/KomodoEdit/issues/1811).
*   Scintilla: Fix font-size calculation with larger DPI settings in Linux - fixes [#1531](https://github.com/Komodo/KomodoEdit/issues/1531).
*   Scintilla: JavaScript: Fixed resetting of line states in ES6 literal syntax highlighting - fixes [#1809](https://github.com/Komodo/KomodoEdit/issues/1809).
*   SDK: Added the filestatus SDK.
*   Search: Only show the relative path (not full path) in search results - fixes [#1722](https://github.com/Komodo/KomodoEdit/issues/1722).
*   Servers: Preserve configured servers on major upgrades - fixes [#1524](https://github.com/Komodo/KomodoEdit/issues/1524).
*   Spellcheck: Added tooltip for misspelled words - fixes [#1688](https://github.com/Komodo/KomodoEdit/issues/1688).
*   Spellcheck: Fix some cases of suggestions being inserted at the end of the document - fixes [#1593](https://github.com/Komodo/KomodoEdit/issues/1593).
*   Stability: OSX: App nap has been disabled on Komodo IDE (not edit), as we suspect it has been causing Komodo to crash - fixes [#1007](https://github.com/Komodo/KomodoEdit/issues/1007).
*   Tcl: Fixed incorrect case of '#' comment detection - fixes [#1570](https://github.com/Komodo/KomodoEdit/issues/1570).
*   Tcl: Highlight "${var}"-style variables too when clicking on them - fixes [#1831](https://github.com/Komodo/KomodoEdit/issues/1831).
*   Troubleshooting: Fix "reset everything" not working - fixes [#1571](https://github.com/Komodo/KomodoEdit/issues/1571).
*   Tutorial-GS: Callout toolbar in step 1 fixes [#1864](https://github.com/Komodo/KomodoEdit/issues/1864).
*   Tutorial-gs: Inst. to enable toolbar fixes [#1864](https://github.com/Komodo/KomodoEdit/issues/1864).
*   Tutorials: Toolbox Tutorial.
*   Tutorials: Version Control tutorial added.
*   UI: Added a "Show Side Toolbar" menu entry to View > Toolbars.
*   UI: Fix file dropdown menu showing inconsistent file status info - fixes [#1763](https://github.com/Komodo/KomodoEdit/issues/1763).
*   UI: Icons can now be colored individually - fixes [#1552](https://github.com/Komodo/KomodoEdit/issues/1552).
*   UI: Limit toolbox icon sizes - fixes [#1605](https://github.com/Komodo/KomodoEdit/issues/1605).
*   UI: You can now change font face/size/spacing globally in appearance preferences.
*   Unittest: PHP: Look for phpunit.phar in $PATH as well - fixes [#1422](https://github.com/Komodo/KomodoEdit/issues/1422).
*   Userscripts: Respect global indentation settings in the userscript editor - fixes [#1786](https://github.com/Komodo/KomodoEdit/issues/1786).
*   UX: Improved Dynamic button updating, this affects cordova, grunt, gulp, npm, phonegap.
*   UX: indent: Mention that per-language indent changes do not reflect immediately - fixes [#1246](https://github.com/Komodo/KomodoEdit/issues/1246).
*   UX:properly save/restore widget state. fixes [#1519](https://github.com/Komodo/KomodoEdit/issues/1519).
*   Vi keys: Fixed '%' (brace matching) to match vi - fixes [#1879](https://github.com/Komodo/KomodoEdit/issues/1879).
*   Vi keys: Handle visual block insert command better.
*   Win-intgr: suppress error we are expecting fixes [#220](https://github.com/Komodo/KomodoEdit/issues/220).
*   Workspace: Save window default layout fixes [#1769](https://github.com/Komodo/KomodoEdit/issues/1769).

### 10.0.1

*   Breadcrumbs: Remote breadcrumbs not showing file listings - fixes [#1690](https://github.com/Komodo/KomodoEdit/issues/1690).
*   CodeIntel: Limit symbol browser to files residing in your project / places root - fixes [#1457](https://github.com/Komodo/KomodoEdit/issues/1457).
*   Commando: Don't break on remote folders - fixes [#1657](https://github.com/Komodo/KomodoEdit/issues/1657).
*   Commands: Improved "cmd_movetab" description - fixes [#1413](https://github.com/Komodo/KomodoEdit/issues/1413).
*   Debugging: NodeJS: Remove leftover Chrome interpreter parameters from a JS debug configuration after switching to NodeJS - fixes [#1456](https://github.com/Komodo/KomodoEdit/issues/1456).
*   Debugging: Run without debugging key binding skips settings dialog - fixes [#1624](https://github.com/Komodo/KomodoEdit/issues/1624).
*   Editor: Block uncomment error on blank lines - fixes [#1509](https://github.com/Komodo/KomodoEdit/issues/1509).
*   Editor: Color hyperlinks not clickable - fixes [#1335](https://github.com/Komodo/KomodoEdit/issues/1335).
*   Editor: Remove source code pro from default fonts (incompatible with Cyrillic characters) - fixes [#1484](https://github.com/Komodo/KomodoEdit/issues/1484).
*   Find: Do not show "include" field for anything other than "in files" searches - fixes [#858](https://github.com/Komodo/KomodoEdit/issues/858).
*   Find: Skip badly encoded filenames in "find in files" rather than erroring out - fixes [#1602](https://github.com/Komodo/KomodoEdit/issues/1602).
*   Formatters: Fail gracefully, fixes custom formatters not working.
*   Help: Removed outdated menu items - fixes [#1512](https://github.com/Komodo/KomodoEdit/issues/1512).
*   Icons: Don't render two reload icons.
*   Icons: Increase padding on pref category icons - fixes [#1486](https://github.com/Komodo/KomodoEdit/issues/1486).
*   Icons: Missing runcmd icon. Fixes [#1586](https://github.com/Komodo/KomodoEdit/issues/1586).
*   Indentation: Honor 'useTabs' setting if 'allow override' is unchecked - fixes [#1518](https://github.com/Komodo/KomodoEdit/issues/1518).
*   Keybindings: Changed find next and debugging key bindings for OSX to be more user friendly and consistent - fixes [#1665](https://github.com/Komodo/KomodoEdit/issues/1665).
*   Keybindings: Vi: Line up/down should navigate over folded code - fixes [#1549](https://github.com/Komodo/KomodoEdit/issues/1549).
*   Linter: Removed "builtin" options for Less and SCSS linting options (note: you can still lint these languages - no functional change) - fixes [#1607](https://github.com/Komodo/KomodoEdit/issues/1607).
*   PHP 7: Updated stdlib catalog to include common constants and array members - fixes [#1633](https://github.com/Komodo/KomodoEdit/issues/1633).
*   Places: Fail gracefully when failing on file - fixes [#1510](https://github.com/Komodo/KomodoEdit/issues/1510).
*   Prefs: Prefs failing to load properly when restoring sub-category - fixes [#1598](https://github.com/Komodo/KomodoEdit/issues/1598).
*   Prefs: Re-enable the "environment" button - fixes [#1511](https://github.com/Komodo/KomodoEdit/issues/1511).
*   SCC: Always sort by date descending - fixes [#1527](https://github.com/Komodo/KomodoEdit/issues/1527).
*   SCC: Git not shown on checkout dialog - fixes [#1468](https://github.com/Komodo/KomodoEdit/issues/1468).
*   SCC: History: Added the revision column again - fixes [#1534](https://github.com/Komodo/KomodoEdit/issues/1534).
*   SCC: New files not being committed - fixes [#1481](https://github.com/Komodo/KomodoEdit/issues/1481).
*   SDK: Editor: Add getWindowPosition method.
*   Startup Wizard: Skip schemes that fail to load - fixes [#1538](https://github.com/Komodo/KomodoEdit/issues/1538).
*   UI: About dialog overlapping contributor list - fixes [#1632](https://github.com/Komodo/KomodoEdit/issues/1632).
*   UI: Bottom pane hiding toolbar if too small - fixes [#1540](https://github.com/Komodo/KomodoEdit/issues/1540).
*   UI: Change default font-size to 1rem (up from 0.9rem).
*   UI: Environment variable editing window too small - fixes [#1407](https://github.com/Komodo/KomodoEdit/issues/1407).
*   UI: Force minimap width (prevents it getting squashed) - fixes [#1529](https://github.com/Komodo/KomodoEdit/issues/1529).
*   UI: Inconsistencies in the cupertino color scheme - fixes [#1438](https://github.com/Komodo/KomodoEdit/issues/1438).
*   UI: Limit places icons size to 14px - fixes [#1404](https://github.com/Komodo/KomodoEdit/issues/1404).
*   UI: Menubar cut off when window is maximized on Windows - fixes [#1461](https://github.com/Komodo/KomodoEdit/issues/1461).
*   UI: Minimap border color.
*   UI: Missing buttons in pref dialogs - fixes [#1506](https://github.com/Komodo/KomodoEdit/issues/1506).
*   UI: Missing findresults copy icon - fixes [#1503](https://github.com/Komodo/KomodoEdit/issues/1503).
*   UI: missing reload button in browser preview - fixes [#1603](https://github.com/Komodo/KomodoEdit/issues/1603).
*   UI: Offset editor tooltips so they don't overlap and flicker - fixes [#1477](https://github.com/Komodo/KomodoEdit/issues/1477).
*   UI: Publishing icons overlapping text - fixes [#1495](https://github.com/Komodo/KomodoEdit/issues/1495).
*   UI: Reduce size of file status icons (collab, publishing, readonly).
*   UI: Side toolbar doesn't stay hidden after restart - fixes [#1482](https://github.com/Komodo/KomodoEdit/issues/1482).
*   UI: Statusbar position indicators causing UI to jump - fixes [#1536](https://github.com/Komodo/KomodoEdit/issues/1536).
*   UI: Styling of check configuration window - fixes [#716](https://github.com/Komodo/KomodoEdit/issues/716).
*   UX: Don't propegate events on dynamic toolbar buttons - fixes [#1563](https://github.com/Komodo/KomodoEdit/issues/1563).
*   Other: Allow stop-restart during addon uninstall / install - fixes [#1594](https://github.com/Komodo/KomodoEdit/issues/1594).
*   Other: Multi-window errors/exceptions - fixes [#1686](https://github.com/Komodo/KomodoEdit/issues/1686).

### 10.0.0

*   CodeIntel: Fixed large memory leak that would keep a CI record around after closing a file - fixes [#627](https://github.com/Komodo/KomodoEdit/issues/627).
*   Collab: Fix issue where user indicators would show on top of windows.
*   Collab: Use tooltip instead of panels, to eliminate focus issues.
*   ColorScheme Editor: The color scheme editor has been significantly overhauled.
*   ColorSchemes: Significantly improved color scheme saving performance.
*   Commando: Fix miss-alignment when opened from the toolbar - fixes [#789](https://github.com/Komodo/KomodoEdit/issues/789).
*   Commando: Fix non-recursive searches not working - fixes [#834](https://github.com/Komodo/KomodoEdit/issues/834).
*   Console: Fixed object keys not dumping in some cases - fixes [#790](https://github.com/Komodo/KomodoEdit/issues/790).
*   Date: Fri Mar 4 12:05:32 2016 -0500.
*   Debug: Fix run without debugging throwing error - fixes [#835](https://github.com/Komodo/KomodoEdit/issues/835).
*   Editor: Fix allow file contents to override .. always being on - fixes [#995](https://github.com/Komodo/KomodoEdit/issues/995).
*   EditorConfig: Reverted a change that made some prefs not apply - fixes [#908](https://github.com/Komodo/KomodoEdit/issues/908).
*   Find: Don't show a notification when closing a find result tab - fixes [#979](https://github.com/Komodo/KomodoEdit/issues/979).
*   Find: Fix "where" section not remembered - fixes [#873](https://github.com/Komodo/KomodoEdit/issues/873).
*   Find: Keep focus inside find frame when tabbing - fixes [#888](https://github.com/Komodo/KomodoEdit/issues/888).
*   Find: Restore focus after the find frame closes - fixes [#805](https://github.com/Komodo/KomodoEdit/issues/805).
*   Fixed regression in Perl interpolated variable highlighting with Scintilla upgrade - fixes [#914](https://github.com/Komodo/KomodoEdit/issues/914).
*   HTTPInspector: Fix failure to initialize.
*   InitService: Implemented partial upgrades.
*   JSX: Fixed syntax highlighting bug that created extraneous fold points - fixes [#1087](https://github.com/Komodo/KomodoEdit/issues/1087).
*   Key bindings: Fixed Mac OSX regression with Cmd+Shift+Up - fixes [#885](https://github.com/Komodo/KomodoEdit/issues/885).
*   Less: Catch file resolving exceptions.
*   Less: Fixed highlighting of class selectors - fixes [#652](https://github.com/Komodo/KomodoEdit/issues/652).
*   Less: Recognize errors from later versions of Less - fixes [#1061](https://github.com/Komodo/KomodoEdit/issues/1061).
*   Linter: Show at most 10 results at a time.
*   Linting: Only notify about the first linting error (don't bombard users with notifications) - fixes [#818](https://github.com/Komodo/KomodoEdit/issues/818).
*   Linux: Potentially fixed Scintilla pixel-related issues with font scaling values != 1.0 - fixes [#162](https://github.com/Komodo/KomodoEdit/issues/162).
*   Non-scannable UDL languages like XML do not have scopes; do not raise errors - fixes [#906](https://github.com/Komodo/KomodoEdit/issues/906).
*   Notifications: Corner notifications should not be too wide.
*   Notifications: Fixed notifications stealing focus, for real this time - fixes [#816](https://github.com/Komodo/KomodoEdit/issues/816), fixes [#837](https://github.com/Komodo/KomodoEdit/issues/837).
*   OpenFiles: Fix tab sorting won't toggle - fixes [#841](https://github.com/Komodo/KomodoEdit/issues/841).
*   Packages: Only ever install the latest available - fixes [#950](https://github.com/Komodo/KomodoEdit/issues/950).
*   Places: view manager fails with no project open.
*   Projects: Fix editor prefs missing under Project prefs - fixes [#929](https://github.com/Komodo/KomodoEdit/issues/929).
*   Projects: Fixed [#860](https://github.com/Komodo/KomodoEdit/issues/860) can't open projects with " " in name.
*   Projects: Places opens in wrong context in newWindow. fixes [#932](https://github.com/Komodo/KomodoEdit/issues/932).
*   Python: Fixed autoindentation corner-case with dictionaries - fixes [#632](https://github.com/Komodo/KomodoEdit/issues/632).
*   Regex Tool: UI Overhaul.
*   Runinline: Consider global environment preferences - fixes [#810](https://github.com/Komodo/KomodoEdit/issues/810).
*   SCC: Added an "Open Web Service" command/menu.
*   SCSS: Use '//' for line comments in SCSS - fixes [#866](https://github.com/Komodo/KomodoEdit/issues/866).
*   SDK: Keybindings: Extended SDK and fixed usedBy.
*   Schemes: keybindings: new default bindings for all platforms.
*   Scope: Sections: Komodo now has project wide symbol browsing.
*   Syntax Checking: Added the syntax checking widget back in (IDE only).
*   Troubleshooting: Fix safe-mode on OSX - fixes [#776](https://github.com/Komodo/KomodoEdit/issues/776).
*   UI: Added support for userChrome.less.
*   UI: Fix missing checkmark icons in menu's on OSX - fixes [#801](https://github.com/Komodo/KomodoEdit/issues/801).
*   UI: Highlight focused elements in the HUD - fixes [#883](https://github.com/Komodo/KomodoEdit/issues/883).
*   UI: The new Komodo interface is fully customizable, you can pick your own colors rn=.
*   UX: Added classic mode (aka I don't like changes mode).
*   UX: Closing multiple files at the same time is now significantly faster.
*   UX: Find: The find frame now no longer closes when focus is lost.
*   UX: Improve speed and UX feedback when opening multiple files.
*   Unit Testing: Improved the user experience.
*   codeintel: Allow autocompletion in anonymous classes - fixes [#1140](https://github.com/Komodo/KomodoEdit/issues/1140).
*   codeintel: Buffers with only one token should not cause errors anymore - fixes [#796](https://github.com/Komodo/KomodoEdit/issues/796).
*   codeintel: CSS: Added flex support from Defman21's PR.
*   codeintel: CSS: Fixed failure to detect selectors in some instances - fixes [#938](https://github.com/Komodo/KomodoEdit/issues/938).
*   codeintel: CSS: added pointer-events property from Defman21 - fixes [#1090](https://github.com/Komodo/KomodoEdit/issues/1090).
*   codeintel: Complete PHP interfaces in "use" statements - fixes [#176](https://github.com/Komodo/KomodoEdit/issues/176).
*   codeintel: Do not create extra, unnecessary CIX files on Windows - fixes [#870](https://github.com/Komodo/KomodoEdit/issues/870).
*   codeintel: Do not error on blank documents - fixes [#895](https://github.com/Komodo/KomodoEdit/issues/895).
*   codeintel: Extract correct type information for PHP variables from '@var' phpdoc in compound declarations - fixes [#752](https://github.com/Komodo/KomodoEdit/issues/752).
*   codeintel: Fail gracefully when the database is incomplete - fixes [#1351](https://github.com/Komodo/KomodoEdit/issues/1351).
*   codeintel: Fixed buggy side-effect of identifying PSR-4 autoloaded classes - fixes [#1241](https://github.com/Komodo/KomodoEdit/issues/1241).
*   codeintel: Fixed computation of the section the current line is in - fixes [#1171](https://github.com/Komodo/KomodoEdit/issues/1171).
*   codeintel: Fixed more instances of PHP completion with `foreach` - fixes [#142](https://github.com/Komodo/KomodoEdit/issues/142).
*   codeintel: Handle nested selectors in LESS - fixes [#1092](https://github.com/Komodo/KomodoEdit/issues/1092).
*   codeintel: Handle nested selectors in SCSS - fixes [#1093](https://github.com/Komodo/KomodoEdit/issues/1093).
*   codeintel: JQuery: Updated catalog to v1.12.1.
*   codeintel: JavaScript: Include HTML5 API by default in stdlib catalog - fixes [#1170](https://github.com/Komodo/KomodoEdit/issues/1170).
*   codeintel: Javascript: Enable local variable visibility for closures - fixes [#502](https://github.com/Komodo/KomodoEdit/issues/502).
*   codeintel: Javascript: Handle scoped variables in class constructors properly as closures.
*   codeintel: Less/SASS: Do not show autocompletions for ':' after variable names - fixes [#1091](https://github.com/Komodo/KomodoEdit/issues/1091).
*   codeintel: Less/SCSS: Added autocompletion for variables - fixes [#737](https://github.com/Komodo/KomodoEdit/issues/737).
*   codeintel: NodeJS: Added "catalogs" for NodeJS v0.10, v0.12, v4.4, and v5.9.
*   codeintel: PHP: Added PHP 7.0 stdlib catalog.
*   codeintel: PHP: Fixed interface method inheritence - fixes [#751](https://github.com/Komodo/KomodoEdit/issues/751).
*   codeintel: PHP: Initial implementation of recognizing PSR-4 autoloaded classes.
*   codeintel: Perl: Autocomplete builtins - fixes [#987](https://github.com/Komodo/KomodoEdit/issues/987).
*   codeintel: Perl: Updated Perl stdlib catalog to Perl 5.22.
*   codeintel: Python: "Goto Definition" should work on both module names and aliases - fixes [#1107](https://github.com/Komodo/KomodoEdit/issues/1107).
*   codeintel: Python: Added stdlib catalogs for 3.4 and 3.5.
*   codeintel: Recognize Javascript ES6 rest parameters.
*   codeintel: Recognize Perl private functions - fixes [#1084](https://github.com/Komodo/KomodoEdit/issues/1084).
*   codeintel: Recognize anonymous PHP functions as parameters - fixes [#980](https://github.com/Komodo/KomodoEdit/issues/980).
*   codeintel: Recognize variables assigned to anonymous classes - fixes [#1047](https://github.com/Komodo/KomodoEdit/issues/1047).
*   codeintel: Ruby: Added stdlib catalogs for Ruby 2.2 and 2.3.
*   codeintel: catalogs: Added Ember.js API catalog and CIX generator.
*   codeintel: golang: Fixed codeintel crash in some instances of "goto definition" - fixes [#461](https://github.com/Komodo/KomodoEdit/issues/461).
*   collab: Show all active sessions in tab's "Share in existing session" context menu - fixes [#578](https://github.com/Komodo/KomodoEdit/issues/578).
*   color schemes: Ensure consistency in applying color schemes - fixes [#730](https://github.com/Komodo/KomodoEdit/issues/730).
*   debug: JavaScript: Debugging JavaScript uses Chrome now; use NodeJS to explicitly debug with the NodeJS debugger.
*   debugger: All versions of NodeJS should be supported now - fixes [#747](https://github.com/Komodo/KomodoEdit/issues/747).
*   debugging: Allow removing breakpoint markers that have moved during editing - fixes [#256](https://github.com/Komodo/KomodoEdit/issues/256), 807.
*   django: Fixed Django linter for Python3 - fixes [#140](https://github.com/Komodo/KomodoEdit/issues/140).
*   editing: Added command and keybindings to remove previously selected word in multi-caret session - fixes [#869](https://github.com/Komodo/KomodoEdit/issues/869).
*   editing: Added option to disable Ctrl+Click creating multiple selections - fixes [#1081](https://github.com/Komodo/KomodoEdit/issues/1081).
*   editing: Added option to retain selected text when smart wrapping - fixes [#904](https://github.com/Komodo/KomodoEdit/issues/904).
*   editing: After smart-selecting XML/HTML tags, typing ' ' consolidates the selection to the opening tag - fixes [#1019](https://github.com/Komodo/KomodoEdit/issues/1019).
*   editing: Allow smart wrap selections to work with 'Shift'ed characters - fixes [#986](https://github.com/Komodo/KomodoEdit/issues/986).
*   editing: Fixed line duplicate up/down at document boundaries - fixes [#1201](https://github.com/Komodo/KomodoEdit/issues/1201).
*   editing: Fixed regression of in-line selection duplication - fixes [#84](https://github.com/Komodo/KomodoEdit/issues/84).
*   editing: Handle encoding mismatch when attempting to pre-process saved files - fixes [#997](https://github.com/Komodo/KomodoEdit/issues/997).
*   editing: PHP: Added preference for selecting the '$' in PHP variables - fixes [#863](https://github.com/Komodo/KomodoEdit/issues/863).
*   editing: Prevent line/block commenting and uncommenting from removing line markers - fixes [#1110](https://github.com/Komodo/KomodoEdit/issues/1110).
*   editing: Smart Wrapping: Define "plain-text" to be in the same Scintilla style - fixes [#1023](https://github.com/Komodo/KomodoEdit/issues/1023).
*   editing: Take care not to delete markers when cleaning EOLs or stripping whitespace - fixes [#754](https://github.com/Komodo/KomodoEdit/issues/754).
*   editing: XML: Auto-close XML tags with multiple carets - fixes [#812](https://github.com/Komodo/KomodoEdit/issues/812).
*   editing: spell check: Added command to ignore words - fixes [#947](https://github.com/Komodo/KomodoEdit/issues/947).
*   editor: Do not auto-expand abbreviations when recording macros or when there is a column selection - fixes [#811](https://github.com/Komodo/KomodoEdit/issues/811).
*   editor: Fix potential division by zero error in smart backspace - fixes [#1106](https://github.com/Komodo/KomodoEdit/issues/1106).
*   editor: Fixed incorrect indent calculation - fixes [#966](https://github.com/Komodo/KomodoEdit/issues/966).
*   editor: Fixed never-ending regexp for double-clicking numbers - fixes [#1015](https://github.com/Komodo/KomodoEdit/issues/1015).
*   editor: Fixed out-of-control drag-and-drop for large files and word wrap - fixes [#901](https://github.com/Komodo/KomodoEdit/issues/901).
*   editor: Ignore smart wrapping when performing a key combination - fixes [#865](https://github.com/Komodo/KomodoEdit/issues/865).
*   editor: Optimize block selection - fixes [#1158](https://github.com/Komodo/KomodoEdit/issues/1158).
*   editor: minimap: Do not allow markers to be shown - fixes [#855](https://github.com/Komodo/KomodoEdit/issues/855).
*   elastic tabstops: Drastically improve performance in large files - fixes [#1034](https://github.com/Komodo/KomodoEdit/issues/1034).
*   elastic tabstops: Respect tab width preference - fixes [#820](https://github.com/Komodo/KomodoEdit/issues/820).
*   find: Give better feedback on bad regular expressions - fixes [#443](https://github.com/Komodo/KomodoEdit/issues/443).
*   install: More robust GDK version checker for Linux - fixes [#799](https://github.com/Komodo/KomodoEdit/issues/799).
*   interactive shell: Fixed pasting into non-empty lines in interactive shells - fixes [#292](https://github.com/Komodo/KomodoEdit/issues/292).
*   interactive shell: Improve toggle interactive shell experience - fixes [#1264](https://github.com/Komodo/KomodoEdit/issues/1264).
*   koextgen: Ensure extension name is valid for user-defined languages - fixes [#983](https://github.com/Komodo/KomodoEdit/issues/983).
*   languages: Added JSERB from Eric Promislow.
*   languages: Added syntax highlighting and linting for TypeScript.
*   languages: New AngularJS lexer and codeintel support.
*   launch new Window: Fixed [#860](https://github.com/Komodo/KomodoEdit/issues/860) opening project.
*   lint: JS: Upgraded JSHint to v2.6.3 and removed JSLint and options wizard - fixes [#603](https://github.com/Komodo/KomodoEdit/issues/603).
*   lint: JavaScript: Use common JSHint options like 'moz' and 'esnext' by default - fixes [#797](https://github.com/Komodo/KomodoEdit/issues/797).
*   lint: Mark whole words in CSS lint warnings - fixes [#931](https://github.com/Komodo/KomodoEdit/issues/931).
*   lint: Prevent 'unused' JSHint warning when editing userscripts - fixes [#1135](https://github.com/Komodo/KomodoEdit/issues/1135).
*   lint: Workaround pylint's handling of relative imports - fixes [#1175](https://github.com/Komodo/KomodoEdit/issues/1175).
*   lint: jsx: Added linting for JSX.
*   lint: stop assuming all multi-lang files are markup-based.
*   prefs: Prevent tab width from being set to zero - fixes [#1009](https://github.com/Komodo/KomodoEdit/issues/1009).
*   schemes: Legacy: move original keybindings to legacy scheme.
*   scintilla: JavaScript: Patched Scintilla to syntax highlight JavaScript ES6 templates.
*   spell check: Added option to not spell check the contents of strings - fixes [#827](https://github.com/Komodo/KomodoEdit/issues/827).
*   unittest: Fixed parsing of Perl's Test::Simple and Test::More unittest output - fixes [#319](https://github.com/Komodo/KomodoEdit/issues/319).
*   unittest: Support Ruby 1.9+ and Rails 4+ (Test::Unit only, MiniTest unsupported).
*   unittest: Support and require PHPUnit 4+ - fixes [#302](https://github.com/Komodo/KomodoEdit/issues/302).

<a name="knownissues"></a>
## Known Issues

### Linux HiDPI Support

Our HiDPI support for Linux has progressed but is still not complete. The best
support is currently provided to Ubuntu, although the implementation is still not
complete. Most notably the editor fonts will by default be a lot bigger than
intended. You can work around this by manually changing your editor font size.

Additionally auto completions may appear miss-aligned, there is currently no
workaround for this.

These issues will be resolved in a future update and are considered a priority
for the dev team.