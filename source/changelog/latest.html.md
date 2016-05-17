---
title: Komodo 10.0 Changelog
sidebar: download
classNames: small-text markdown
---

# Komodo IDE/Edit 10.0 Release Notes

These Release Notes cover [what's new](#whatsnew), [detailed changes and bug fixes](#details) and [known issues](#knownissues) for Komodo IDE and Komodo Edit.

<a name="whatsnew"></a>
## What's New in Komodo IDE/Edit

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

* Improved source code control UI and UX (IDE only)
* New SCC Commit Dialog (IDE only)
* New SCC Widget (IDE only)
* Improved unit testing UI and UX (IDE only)
* Improved color picker UI and UX
* New color scheme editor
* New UI SDK (used in our new [First Start Wizard](https://github.com/Komodo/KomodoEdit/blob/10.0.0-alpha1/src/chrome/komodo/content/startupWizard/startupWizard.js#L53))
* and much much more (see below) ..

<a name="details"></a>

## Detailed Changes and Bug Fixes in Komodo IDE/Edit

Changes related to Debugging, Interactive Shells, Source Code
Control, HTTP Inspector, Rx Toolkit, Code Browser, Database Explorer
and the Sections List only apply to Komodo IDE only.

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