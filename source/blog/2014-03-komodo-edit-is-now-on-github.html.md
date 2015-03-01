---
title: Komodo Edit Is Now On GitHub!
author: Todd Whiteman
date: 2014-03-05
tags: [git, github]
description: Both Git and GitHub are playing an increasing role in Komodo's development process. See how, why and where the Komodo team are using Git for source code control.
---

<a style="font-size: 128px; margin: 10px;" href="https://github.com/Komodo/KomodoEdit" class="push-right">
    <i class="icon icon-github"></i>
</a>

The source code for Komodo Edit is [now available on GitHub][github]. It has been for a short while now but we never quite anounced it, as we're still moving over parts of our codebase.

Komodo is a huge supporter of open source software, and we are proud to show
that Komodo Edit has been open source for 7 years (since 2007) - licensed
under the [Mozilla Public License](http://en.wikipedia.org/wiki/Mozilla_Public_License)
(MPL). Our code also makes use of many open source components, such as the
Mozilla Firefox platform and Python runtime.

Note that for now our Komodo Edit GitHub repository is still mirroring an
existing [Subversion repository](http://svn.openkomodo.com/openkomodo), but soon
all Komodo code will move away from Subversion, and the Komodo code-base will be
purely under Git.

## Why Git?

We've chosen to use Git over Subversion for these reasons:

  * **Speed** - Git is durn fast
  * **Distributed** - developers can work (and commit) locally without having
    to connect back to a central repository. Commands run locally, rather than
    having to fetch from a centralized server
  * **Commands** - with builtin commands like
    *[git stash](https://www.kernel.org/pub/software/scm/git/docs/git-stash.html)*
    and
    *[git commit --amend](https://www.kernel.org/pub/software/scm/git/docs/git-commit.html)*,
    it can be both clever and forgiving
  * **Branching** - Git has lightweight branches with superior
    merging capabilities (though I admit newer Subversion releases are
    catching up in the merging department)
  * **Fast** - did I mention Git is durn fast?!

Now, with the good being said, we'd be remiss if we didn't mention a few rough
edges as well:

  * **Terminology** - with words like *origin* and *master*, it seems to better
    fit in with a Star Wars movie, rather than source code control tools
  * **Command line syntax** - *git reset --hard HEAD~1* and *git push origin
    master*, you'd be forgiven if you banged your head on your first attempt at
    using Git

All in all, we're pretty happy with the move to GitHub and look forward to using
more Git in the future.

## Komodo on GitHub

We have already moved many of our code repositories onto the GitHub page, such as:

### Website

Our [new website](https://github.com/Komodo/komodo-website) that runs
on komodoide.com is all open-source and available under GitHub - for more
details on how that works, check out Nathan's
[blog post](http://komodoide.com/blog/2014-02/new-website-launched/).

### Add-ons

  * [Abyss Skin](https://github.com/Komodo/Mel) - this is the code for the new
    dark skin (theme) in Komodo 8. Anyone wanting to create (or tweak) their own
    skin should take a look at this
  * [To-do Helper](https://github.com/Komodo/Todo) - adds a todo widget into the
    bottom Komodo pane that will display any todo markers left in your source
    code
  * [Side By Side Diffs](https://github.com/Komodo/SideBySideDiff) - which
    provides an alternative diff viewer in Komodo that shows a side-by-side file
    comparison

### Macros

  * [Wrap Text](https://github.com/Komodo/macros#wrap-text) - wraps the editor
    selection with custom text. Easily enclose text within HTML tags or
    stringify a selection
  * [PHPDoc and JSDoc](https://github.com/Komodo/macros#phpdoc-and-jsdoc) -
    automatically creates javadoc style comments for functions and variables
  * [Incremental
    Numbering](https://github.com/Komodo/macros#incremental-numbering) - inserts
    a number into a column selection, incrementing the number for every line

For a more complete overview of our repos, check out [our GitHub Organization page][github org].

## Git Functionality inside Komodo

*What about Komodo itself - does it support Git?*

Komodo IDE does indeed provide support for Git (but not Komodo Edit), showing
the file status directly inside of the IDE and providing commands for common
actions like clone, pull, add, remove, diff, revert, commit, log and push.

Here's screenshots of the Open Files pane showing source code control status and
the commit dialog ready to check in modified files:

<div class="centered">
    <img alt="SCC File Status" src="/assets/images/blog/2014-03/scc_file_status.png">
    <img alt="SCC Commit"      src="/assets/images/blog/2014-03/scc_commit.png">
</div>

Please let us know if there are more things you'd like to see in Komodo with
regards to Git.

   [github]: https://github.com/Komodo/KomodoEdit "Komodo Edit on GitHub"
   [github org]: https://github.com/Komodo/ "The Komodo Organization on GitHub"
