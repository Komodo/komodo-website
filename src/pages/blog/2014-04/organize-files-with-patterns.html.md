---
title: Organize Files With Patterns
author: Nathan Rijksen
date: 2014-04-21
tags: [files, openfiles, macros, javascript, mvc]
description: Did you know you can organize your open files using your own custom patterns? This can be incredibly useful for example when you're working in a Project that uses the MVC pattern. Imagine not just having your files grouped by language but also by their pattern (model, view, controller).
layout: blog
---

<div class="centered">
<h2 style="font-weight: 300; margin: 10px 0 25px 0"><em>Macro Monday - a new macro to dig into every Monday!</em></h2>
</div>

<a href="/images/blog/2014-04/openfiles.png" class="lightbox">
    <img src="/images/blog/2014-04/openfiles_thumb.png" align="right"/>
</a>

Did you know you can organize your [Open Files] using your own custom patterns?
This can be incredibly useful for example when you're working in a Project that
uses the MVC pattern. Imagine not just having your files grouped by language but
also by their pattern (model, view, controller).

To use your own custom patterns you can feed your data straight into the [Open Files]
library component by accessing the Komodo API through your macro. It boils down
to the following snippet.

```javascript
ko.openfiles.groupers.byPattern.patterns = [
    {
        // The name you want to give your group
        name:       'Model',

        // The RegEx pattern that should match the filepath
        pattern:    /\/(?:model|models)(?:\/|$)/i
    },
    {
        name:       'View',
        pattern:    /\/(?:view|views)(?:\/|$)/i
    },
    {
        name:       'Controller',
        pattern:    /\/(?:controller|controllers)(?:\/|$)/i
    },
];

ko.openfiles.reload(true);
```

That's basically all you have to do, define some groups and tell [Open Files] to
reload. The `true` parameter tells it to do a full reload, rather than just try
to sort and group the existing entries.

## Dynamic Group Names

Maybe you're one of those devs working in huuuuge projects, where just grouping
by a basic pattern doesn't quite cut it, and writing custom patterns for tons of
different combinations isn't worth the effort. What you can do then is use a
pattern and use a Regex group to define your pattern name. Let's say we have the
following folder structure:

 * project/views/admin/user.php
 * project/views/admin/files.php
 * project/views/invite/user.php
 * project/views/invite/callback.php
 * project/views/public/user.php

And you want to group these files into the following groups:

 * Views - admin
 * Views - invite
 * Views - public

You can use a Regex group to define your group names like this:

```javascript
ko.openfiles.groupers.byPattern.patterns = [
    {
        name:       'Views - %match%',
        pattern:    /\/(?:model|models)\/([a-z0-9_-]*)\//i
    }
];

ko.openfiles.reload(true);
```

You can probably imagine how powerful this can be in huge projects.

## Styling Groups

Let's say you want your group to have specific styling and give it's entries a
color and maybe an icon to go along with it. To do this you can simply add a "classlist"
attribute to your group definition, this attribute should hold an array as its
value which contains string values representing the names of CSS classes that
you want to add for this group and its children. Let's see what this should look
like.

```javascript
ko.openfiles.groupers.byPattern.patterns = [
    {
        name:       'Model',
        pattern:    /\/(?:model|models)(?:\/|$)/i,
        classlist:  ['pattern_model']
    }
];

ko.openfiles.reload(true);
```

Using this pattern all files matching the given pattern will be placed into a
`Model` group and your group label will be given a "pattern_model" css class.
How you decide to style it from there is up to you, for example you could color
your group label red and give it an icon:

```css
#openfilesListbox .group-item.pattern_pages
{
    color: red;
    background: url("chrome://icomoon/skin/icons/smiley.png") left center no-repeat;
    padding-left: 18px !important;
}
```

You can easily play with some custom styles by installing the [Sylish addon].

   [Open Files]: http://komodoide.com/screencasts/watch/87675282-open-files-widget/
   [Stylish addon]: https://addons.mozilla.org/en-US/android/addon/stylish/versions/
