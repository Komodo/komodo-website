---
title: Introducing kopy.io
author: Nathan Rijksen
date: 2014-10-15
tags: [addon, css, customization]
description: Today we finally launched kopy.io after having had it in soft-launch for about 2 weeks. kopy.io is a new "service" for Komodo. Essentially it is a pastebin alternative with a bunch of little extras you likely wont find in other pastebin solutions.
layout: blog
---

Today [we finally launched kopy.io][0] after having had it in soft-launch for about 2
weeks. kopy.io is a new "service" for Komodo. Essentially it is a pastebin
alternative with a bunch of little extras you likely wont find in other pastebin
solutions. Namely you can;

## Create Private Kopies

When creating a kopy you can set its privacy to "Client-Side Encryption", this
will encrypt your data client-side and send the server the encrypted data. The
key needed to decrypt the data is never sent to the server and it's up to you
to decide how/who you share this key with. If someone were to access your kopy
without the encryption key they'd be met with disappointment.

## Customize It To Your Liking

We've added a bunch of user specific preferences that you can control by pressing
the preferences button. This will allow you to configure things such as the
font size, line spacing, color scheme, etc. When you share a kopy with someone
who doesn't have their own preferences set for kopy.io they will use your
preferences. So you can add some flavour to your kopies.

## Write/Alter Code in a Real Editor

When you paste or write code on kopy.io you are actually using
[CodeMirror](http://codemirror.net/), which will (amongst other things) highlight
your code as you type.

## Have kopy.io Detect Things For You

By default kopy.io will resize your kopy's text according to the size of the
kopy in relation to the browser viewport size. Meaning that if you share a very
large kopy the text will be smaller, whereas if it is a short kopy your text will
be larger.

Additionally kopy.io will attempt to detect what language you are using when you
type and apply highlighting accordingly.

# Start Using kopy.io

There are a few alternative ways you can paste data onto kopy.io:

## Within Komodo

You can start using kopy.io today by [downloading the addon from our Resources section][1].
Komodo 9 will have support for kopy.io built in.

Once the add-on is installed, Komodo gains an editor context menu where you can
send a text selection directly to kopy.io.

## Within Shell

You can use kopy.io from your command line with this handy little function:

```bash
kopy() { a=$(cat); curl -X POST -s -d "raw:$a" http://kopy.io/documents | awk -F '"' '{print "http://kopy.io/"$4}'; }
```

Simply put it in your `.bashrc` and pipe your data to kopy, eg: `echo "hello world" | kopy`.

# Follow kopy.io

The easiest way to get notified of kopy.io news is by following [the kopy.io twitter
account][2]. <a href="https://twitter.com/kopyio" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @kopyio</a>

# More Info

For more information, [check out the kopy.io about page][3].

   [0]: http://kopy.io/
   [1]: http://komodoide.com/resources/addons/komodo--kopyiointegration/
   [2]: https://twitter.com/kopyio
   [3]: http://kopy.io/about.md
