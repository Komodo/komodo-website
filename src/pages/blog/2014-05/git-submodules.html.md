---
title: Git Submodules
author: Todd Whiteman
date: 2014-05-14 6:00
tags: [macro, javascript, editor, auto-complete]
description: What you need to know about using Git submodules. We're sharing what we've learnt when using Git submodules in the Komodo code base.
layout: blog
---

<a style="font-size: 128px; margin: 10px;" href="https://github.com/Komodo/KomodoEdit" class="push-right">
    <i class="icon icon-github"></i>
</a>

Since using Git submodules in our Komodo code base, we've learnt some
interesting things about submodules that we'd like to share.

Git submodules work really well for splitting out code bases into separate
repositories, but there are still a few things you should be aware of. There's a
lot of out-of-date information on the web, so pay attention to the date of the
articles you read, as git has been changing (getting better) all the time.


## About Submodules

A submodule in a git repository is like a sub-directory which is really a
separate git repository in its own right.

There is a special ```git submodule``` command included with git, and this
command takes various arguments in order to add/update/delete your submodules.

You can set the submodule to track a particular branch (requires git 1.8.2+),
which is what we are doing with Komodo, or you can reference a particular
repository commit (the later requires updating the main repository whenever you
want to pull in new changes from the module - i.e. updating the commit hash
reference).

One special thing to note about submodules, is that by default they are first
initialized into a detached head state (like an anonymous git branch), so if you
want to work on this submodule code later, you'll first need to update the
information (checkout) to be able to push your changes correctly.


## Using Submodules

### Creating

To create a submodule, you create a new repository to host your module code and
then link that into the main repository project. For example, we've created a
[trackchanges] repository (a new feature coming in Komodo 9) that we're linking
into the main [Komodo Edit] repository as a submodule:

```
cd KomodoEdit
git submodule add -b master https://github.com/Komodo/trackchanges.git src/modules/trackchanges
```

Using the **-b** argument means we want to follow the master branch of the
trackchanges repository, and after running this command we'll have an empty
src/modules/trackchanges directory.

You'll need to run a special submodule initialize command (i.e. after cloning
the main repository) to fetch the code for the first time:

```
git submodule update --init
```

### Updating

Now, git uses the *update* command to also fetch and apply updates, but this
time the arguments are slightly different:

```
git submodule update --remote
```

This will update the trackchanges submodule we added earlier, to the latest version.

Note that you'll need to have run the *--init* before being able to update.


### Editing

Now that we have a our submodule playing nicely, it would be useful if we could
go and edit this submodule code in place, making commits and pushes, which is
exactly what we'll do next. It requires a few additional git commands to change
from a detached head into a proper remote branch.

```
cd src/modules/trackchanges
git checkout master
```

This gets you into a state where you can edit, commit and push your changes back
to the trackchanges repository.

Note that for GitHub you may wish to change from using *https://* into a
*ssh://* remote url (to be able to authenticate using ssh) - to do that you'll
want to edit the submodule config file, which you can get from the ".git" file
in your submodule:

```
cat .git
gitdir: ../../../.git/modules/src/modules/trackchanges
```

This *gitdir* directory holds the git config file for your remote, so update
that accordingly.

One thing to note about submodule editing, if you run the *git submodule update
--remote* command, your module will go back into being in a detached head state,
so you'll need to remember to re-checkout the next time you want to edit it
again.


## Summary

In summary, git submodules are a flexible way to de-couple your code base, but
it does require some additional learning of git commands in order to manage and
update these separate code bases. All in all I think this a worthy trade-off and
much better than trying to utilize third-party alternatives (like *Git Subtree*
or *Google's Repo*).

There are a lot of git resources out there - this [Git tutorial] is a good
thorough reference, otherwise you'll likely find what you need on [Stack
Overflow].

   [trackchanges]: https://github.com/Komodo/trackchanges
   [Komodo Edit]: https://github.com/Komodo/KomodoEdit
   [Git tutorial]: http://www.vogella.com/tutorials/Git/article.html
   [Stack Overflow]: http://stackoverflow.com/
