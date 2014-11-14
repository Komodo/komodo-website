---
title: Live Markdown Preview in Komodo
author: Todd Whiteman
date: 2099-11-22
tags: [add-on, markdown, preview]
description: Showing a live Markdown preview inside of Komodo.
layout: blog
---

<img src="https://raw.githubusercontent.com/dcurtis/markdown-mark/master/png/208x128.png" align="right"/>

Since the Komodo team have been using GitHub more and more, we've been writing a
lot more [Markdown] content. I personally like markdown (we actually write our
blogs in Markdown too), as it's simple text formatting makes it faster (for me)
to write web-based content.

Now, the only problem I was having with writing Markdown in Komodo, is that I
had to use an external tool to generate the HTML content in order for me to do a
final validation for what I'd written.

With the addition of the [Markdown Viewer] add-on, this is no longer a problem!
I can view the generated HTML directly within Komodo and the HTML preview will
update itself whenever I make a change to the Markdown text - it doesn't even
need to be saved.

The Markdown preview uses GitHub styling (though we mke this optional in the
future, or support other markdown variants), so you should now feel right at
home when writing Markdown inside of Komodo.

## Features

- A small Preview button appears in the top-right corner of the editor whenever
  a Markdown file is open
- Automatically closes the markdown preview when switching to another file,
  re-opens when switching back
- Allows side-by-side, or under-over previewing inside of Komodo
- Dynamically updates the markdown preview as you edit (live editing)
- Uses GitHub flavoured CSS styling
- Styles code blocks inside of triple back quotes

# Screenshot

![Screenshot](https://github.com/Komodo/markdown-viewer/raw/master/screenshots/markdown-viewer.png)

## Source Code

The code for the Markdown Viewer add-on is open-source at GitHub, in the Komodo
[markdown-viewer] repository. We've love to hear from people trying the add-on, and
hopefull we'll see contributions from other users.

## Installation

To install the add-on simply hit the "View Resource" and "Install Instructions"
links below.

Once the add-on is installed - just open a Markdown file and you should see a
"Preview" button in the top-right corner.

<div class="centered">
    <div class="spacer"></div>
    <a href="http://komodoide.com/resources/addons/komodo--markdownviewer/" class="button big primary">
        <i class="icon icon-eye"></i>
        View Resource
    </a>
    <div class="spacer-half"></div>
    <span>
        <i class="icon icon-question"></i>
        <a href="http://komodoide.com/resources/install-instructions/#pane-addon" target="_blank">Install Instructions</a>
    </span>
</div>

[Markdown]: http://en.wikipedia.org/wiki/Markdown
[Markdown Viewer]: http://komodoide.com/resources/addons/komodo--markdownviewer/
[markdown-viewer]: https://github.com/Komodo/markdown-viewer
