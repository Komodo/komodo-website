module.exports = [
    name: 'Advanced Editor'
    id: 'editor' # Must match icon name
    featured: [
        name: 'Syntax Checker'
        image: 'editor-1'
    ,
        name: 'Split View Editing'
        image: 'editor-2'
    ,
        name: 'Column/Block Editing'
        image: 'editor-3'
    ]
    items: [
        name: 'Multiple Selections'
        description: 'Select multiple positions in the editor, so that changes made at one position will be reflected in all selected positions.'
        isNew: true
    ,
        name: 'Unified Menu Button'
        description: 'Komodo can be configured to use a collapsed toolbar button menu, instead of a full menu bar (Windows and Linux).'
        isNew: true
    ,
        name: 'Code Folding / Code Blocks'
        description: 'Code folding<br>Column/block editing,<br>Line/block commenting and more'
    ,
        name: 'Smart Language Detection'
        description: 'Syntax checking and highlighting detects multiple languages within a file.'
    ,
        name: 'Split View and Multi-Window'
        description: 'Split a session to edit side by side or in multiple windows.'
    ,
        name: 'Variable Highlighting'
        description: 'Click on a variable to see all occurrences.'
    ,
        name: 'Auto Abbreviation Snippets'
        description: 'Type an abbreviation to automatically trigger snippet selection.'
    ,
        name: 'Key Bindings'
        description: 'Vi/Vim, emacs, OS X, Windows/Linux included.'
    ,
        name: 'Powerful Snippets and Macros'
        description: 'Insert snippets with abbreviations. Use macros to automate repetitive sequences.'
    ,
        name: 'Conditional Snippets'
        description: 'Use Embedded JavaScript to determine snippet contents at runtime.'
    ]
,
    name: 'Code Intelligence'
    id: 'codeintel'
    featured: [
        name: 'Autocomplete and Calltips for most major languages'
        image: 'codeintel-1'
    ,
        name: 'Code Browser'
        description: 'Structured source code for easier navigation'
        image: 'codeintel-2'
    ,
        name: 'Autocomplete for API catalogs via XML files'
        image: 'codeintel-3'
    ]
    items: [
        name: 'Code Refactoring'
        description: 'Smart code-transformation capabilities include Rename Variable, Rename Class Member, and Method Extraction.'
        isNew: true
    ,
        name: 'Autocomplete and Calltips'
        description: 'Supports many languages and detects multiple languages within a file.'
    ,
        name: 'Soft Characters, Matching Braces'
        description: 'Auto-insertion of braces and highlighting of matching braces.<br>Auto-Indentation and Auto-Formatting'
    ,
        name: '3rd Party Library Support'
        description: 'Included API Catalogs enable autocomplete and calltips for libraries like PyWin32 and jQuery.'
    ,
        name: 'Sections List'
        description: 'View and filter a list of your functions, classes or elements.'
    ,
        name: 'Code Browser'
        description: 'Navigate source code structure in a hierarchical, collapsible view.'
    ,
        name: 'Go To Definition'
        description: 'Jump to definitions variables, classes, etc.'
    ,
        name: 'DOM Viewer'
        description: 'Inspect and edit DOM tree of XML and HTML docs.'
    ,
        name: 'XML Autocompletion'
        description: 'Autocompletion for XML dialects can be added via DTD or RelaxNG Schema.'
    ]
,
    name: 'Graphical Debugging'
    id: 'debugger'
    featured: [
        name: 'Graphical Debugger'
        description: 'PHP 4.4 - 5.4, Python 2.4 - 3.3, Perl 5.8 - 5.16, Ruby 1.8 - 1.9, Tcl 8.4 - 8.6, Node.js'
        image: 'debug-1'
    ,
        name: 'RX Toolkit'
        image: 'debug-2'
    ,
        name: 'HTTP Inspector'
        image: 'debug-3'
    ]
    items: [
        name: 'Graphical Debugger'
        description: 'PHP 4.4 - 5.5, Python 2.4 - 3.3, Perl 5.8 - 5.16, Ruby 1.8 - 1.9, Tcl 8.4 - 8.6, Node.js'
    ,
        name: 'Breakpoint Configuration'
        description: 'Set properties such as break on file, line, condition, function calls and returns, exceptions, etc.'
    ,
        name: 'Local and Remote'
        description: 'Debug programs running on a remote server or unsupported platform.'
    ,
        name: 'RX Toolkit'
        description: 'Create and debug regular expressions'
    ,
        name: 'Consolidated View'
        description: 'View output, call stack, variables and watch variables in one pane.'
    ,
        name: 'Multithreaded Debugging'
        description: 'Break multiple threads. Mozilla engineers use Komodo to debug Python buildbot code.'
    ,
        name: 'Multi-Process Debugging'
        description: 'Debug multiple sessions simultaneously'
    ,
        name: 'HTTP Inspector'
        description: 'Inspect browser-server communications, ie. Ajax/HTTP'
    ,
        name: 'Changed Variable Highlighting'
        description: 'Automatic highlighting of variables changed since last breakpoint.'
    ,
        name: 'Built on DBGp Protocol'
        description: 'Co-authored by ActiveState and currently used in many IDEs.'
    ]
,
    name: 'Version Control and Integrated Tools'
    id: 'tools'
    featured: [
        name: 'Integrated Unit Testing'
        description: 'Major frameworks such as PHPUnit, Perl TAP, Python unittest, and Ruby\'s rake test'
        image: 'tools-1'
    ,
        name: 'Version Control Systems '
        description: 'Subversion, Mercurial, Git, CVS, Perforce and Bazaar supported'
        image: 'tools-2'
    ,
        name: 'Interactive Shells'
        description: 'Python, Ruby, Perl and Tcl'
        image: 'tools-3'
    ]
    items: [
        name: 'Version Control Systems'
        description: 'Support for Subversion, Mercurial, Git, CVS, Perforce and Bazaar.<br><br>Add/remove files, view diffs, view revision history, commit changes, revert, and push to remote repositories for distributed source code control systems.'
    ,
        name: 'Interactive Shells'
        description: 'Available for Python, Ruby, Perl and Tcl.'
    ,
        name: 'Publishing'
        description: 'Keep local and remote directories in sync.'
    ,
        name: 'Browser Preview'
        description: 'Preview in a separate window, in the Editor pane or in split view.'
    ,
        name: 'Code Profiling'
        description: 'Analyze performance for Python (2x and 3x) and PHP (5.2 or higher), with read support for Callgrind/Cachegrind and pstats formats.'
    ,
        name: 'Integrated Unit Testing'
        description: 'Supports major frameworks such as PHPUnit, Perl TAP, Python unittest, and Ruby\'s rake test.'
    ,
        name: 'Toolbox'
        description: 'Store snippets, macros and shell commands for easy access.'
    ,
        name: 'Database Explorer'
        description: 'Examine database content for SQLite. Available extensions for MySQL and Oracle.'
    ,
        name: 'Perl Dev Kit, Tcl Dev Kit'
        description: 'Deploy Perl and Tcl applications within Komodo. Get more with Pro Studio.'
    ,
        name: 'Stackato by ActiveState'
        description: 'Deploy to and debug applications in a powerful Platform-as-a-Service environment.'
    ]
,
    name: 'Workflow and File Management'
    id: 'nav'
    featured: [
        name: 'Fast Open'
        description: 'Quickly access files by typing a typing a few characters'
        image: 'nav-1'
    ,
        name: '"Open Files" Side Pane'
        description: 'Organizes open files by language'
        image: 'nav-2'
    ,
        name: 'Notifications Panel'
        description: 'Keep track of all processes in one place'
        image: 'nav-3'
    ]
    items: [
        name: 'Breadcrumbs Navigation'
        description: 'Breadcrumbs navigation bar shows the directory ancestors relative to the current editor file, allowing you to easily find and open related files.'
        isNew: true
    ,
        name: 'Open Files Side Pane'
        description: 'New side pane organizes all your open files by language.'
        isNew: true
    ,
        name: 'File Sorting and Grouping'
        description: 'Sort and group the Open Files pane by language, file extension, directory and location.'
        isNew: true
    ,
        name: 'Fast Open Shortcuts'
        description: 'Create shortcuts to long file paths.'
        isNew: true
    ,
        name: 'Minimap Navigation'
        description: 'Reposition anywhere in your code from a high-level view.'
        isNew: true
    ,
        name: 'Projects & Places'
        description: 'Manage your projects in the left sidebar. View your file systems categorized by project.'
    ,
        name: 'Fast Open'
        description: 'Find any file with minimal keystrokes.'
    ,
        name: 'History, Bookmarks, Braces'
        description: 'Jump to previous and marked lines, and matching braces.'
    ,
        name: 'Notifications Panel'
        description: 'Keep track of all processes in one place.'
    ,
        name: 'Komodo Sync'
        description: 'Synchronize project items and preferences across all of your workstations.'
    ]
,
    name: 'Add-Ons and Customization'
    id: 'ui'
    featured: [
        name: 'Extensions/Add-Ons'
        description: 'Over 200 community-contributed add-ons Firefox-based system'
        image: 'extend-1'
    ,
        name: 'Visual Styling'
        description: 'Customize Komodo with skins and icon sets'
        image: 'extend-2'
    ,
        name: 'Floating Panes'
        description: 'Undock any feature side pane ie. Debug and place it anywhere'
        image: 'extend-3'
    ]
    items: [
        name: 'Abyss Dark Theme'
        description: '"Abyss" native dark UI theme can be enabled in preferences. Goes well with "Dark_Wombatsosia" editor scheme.'
        isNew: true
    ,
        name: 'Floating Side Panes'
        description: 'Undock components and move them anywhere on screen.'
        isNew: true
    ,
        name: 'Extensions/Add-Ons'
        description: 'Over 100 add-ons available through our Firefox-based system.'
    ,
        name: 'Visual Styling'
        description: 'Personalize with a wide variety of skins and iconsets.'
    ,
        name: 'Integrated Tools'
        description: 'Extend support for additional Version Control Systems and databases.'
    ,
        name: 'Editor Features'
        description: 'Customize and extend key bindings, syntax color schemes, auto-formatters and much more.'
    ,
        name: 'Autocomplete'
        description: 'Extend support for additional languages, frameworks and libraries.'
    ]
,
    name: 'Dev Team Capabilities'
    id: 'collab'
    featured: [
        name: 'Code Collaboration'
        description: 'Edit a document with other users simultaneously'
        image: 'collab-1'
    ,
        name: 'Stackato by ActiveState'
        description: 'Using Komodo IDE, deploy applications to the PaaS and debug within the cloud environment.'
        image: 'collab-2'
    ,
        name: 'Stackato by ActiveState'
        description: 'Using Komodo IDE, deploy applications to the PaaS and debug within the cloud environment.'
        image: 'collab-3'
    ]
    items: [
        name: 'Code Collaboration'
        description: 'Edit a document with multiple users simultaneously, no matter where they are.'
    ,
        name: 'Shared Toolbox'
        description: 'Store common snippets, macros, etc. via network share, source code control or the Publish feature.'
    ,
        name: 'Coding Standards and Control'
        description: 'Keep shared work consistent with version control system integration and auto-formatting.'
    ,
        name: 'Stackato by ActiveState'
        description: 'Run a Platform-as-a-Service (PaaS) on any cloud infrastructure.<br>Komodo IDE lets you debug and deploy applications to a consistent environment at each stage of the development process.'
    ,
        name: 'Extended Functionality'
        description: 'Scale projects as required with extensions for integrated technologies.'
    ]
,
    name: 'Supported Languages'
    id: 'languages'
    items: [
        name: 'Editing'
        description: 'PHP, Python, Perl, Ruby, HTML, JavaScript, CSS, various web templates, Node.js, Tcl, XSLT, CoffeeScript, LESS, SCSS and more'
    ,
        name: 'Code Intelligence'
        description: 'PHP, Python, Perl, Ruby, HTML, JavaScript, CSS, various web templates, Node.js, Txl, XSLT and more'
    ,
        name: 'Debugging'
        description: 'PHP, Python, Perl, Ruby, Node.js, Tcl, XSLT'
    ]
]
