---
title: Debug Komodo with Komodo
author: Carey Hoffman   
date: 2014-08-08 06:00
tags: [debugging, python, Komodo IDE, remote debugging]
description: Ever wondered what's going on in there when you're working with Komodo?  Ever wondered how a component works?  Well why not walk through the code as Komodo does?
layout: blog
classNames: lightbox-group document-blog-entry
---

<a name="top"></a>

<div class="push-right toc">
    <ul>
        <li>
            <a href="#context">Context and Packages</a>
        </li>
        <li>
            <a href="#launch_debugger">Launching Debugger</a>
        </li>
        <li>
            <a href="#final">Final Words</a> 
        </li>
        <li>
            <a href="#try_it">Real Life Scenario</a> 
        </li>
    </ul>
</div>

Recently I was providing support to a customer who was having issues with a Komodo
component.  Unfortunately, when that component was originally written there was
a line similar to <code language="python">log.setLevel(logging.DEBUG)</code> added
but zero debug logging statements added.  This didn't help much when I asked the
user to uncomment line of code above.  I had been testing remote Python debugging
in Komodo just before so I decided to try a trick I'd heard about from @Mark Yen.
He said that it was possible to debug Komodo using Komodo.  It a little bit of
head scratching but given that I knew remote debugging fairly well it was just a
matter of putting all the piece into place or context.  That's what I'm going to
share with you.


<div id="context">
## Context and Packages  <a href="#context">@</a>
</div>

The key to remote debugging is addingthe Komodo debugging package to either the
language path or to a package folder that the language searches.  The Python
debugging package can either be found in your Komodo install
<code>(Komodo Install Dir)/lib/support/dbgp</code>.  You can also find it on
the [ActiveState Code page](http://code.activestate.com/komodo/remotedebugging/).

So now you show the Python that you'll be running where that is on your system
but where or what is that?  As many of you probably know, Komodo run's mainly on two dynamic
languages; Javascript and Python.  Komodo ships with it's own siloed Python to make
our lives easier.  It's a standard...ish Python install.  The
[Komodo Python remote debugging docs](http://docs.activestate.com/komodo/8.5/debugpython.html#Installing_the_Python_Remote_Debugger)
say you add it's lcoation to the PythonPath but as far as I know, we don't easily
have control over that in Komodos world.

Since Komodo's Python is a pretty standard Python install, I decided to do the wrong
thing and just add the dbgp package to <code>(Komodo Install Dir)/lib/Python/Lib/site-packages/</code>.
Now Komodo will find it on startup.

<div id="launch_debugger">
## Launching Debugger  <a href="#launch_debugger">@</a>
</div>
Now that we have the debugging package install in Komodo's siloed Python we have
access to the debugger.  But now what?  We can't click **Go** in Komodo the
component file...can I?

NO, no you can't.  Komodo is already running.  Besides, it's impossible to start debugging
Komodo in that traditional manner since it's the Mozilla framework (mostly C++) that
does the initial object creation and launching various Python components.

What we need here is [Just in Time (JIT) debugging](http://docs.activestate.com/komodo/8.5/debugpython.html#debugpython_dbgpclient_functions)
provided by <code language="python">dbgp.client.brk()</code>.  This allows us to
trigger a breakpoint in our running code and cause Python to request a debugging
session from the Komodo you point it at.  See the link above for an example of a
JIT breakpoint.  Make sure the Komodo you'll use to run the debugger is listening
on the correct port as per standard remote debugging setup instructions.

<div id="try_it">
## Try It Out <a href="#try_it">@</a>
</div>

When I was fiddling with this I was digging into the publishing feature so lets
plug some breakpoints in there.  The [Publishing Tool in Komodo IDE](http://docs.activestate.com/komodo/8.5/publish.html#publish_top)
is integrated as an extension to Komodo.  You can find it's source at <code>(Komodo Install Dir)/lib/mozilla/extensions/publishing@ActiveState.com/components/</code>.
You'll start by importing **brk** from the **dbgp** package.  I do this at the
top of the file as a force of habit:
```python
from dbgp.client import brk

I then put a breakpoint in the **pushLocalUri** function in **koPublishing.py**.
```python
def pushLocalUri(self, uri, transferCallback=None, forcePush=False, pubSettings=None):
    brk(host="127.0.0.1", port=9005)

Make sure you've got your Komodo set to listen on that port;  Edit (Komodo on mac) > Preferences > Debugging > Connection.
Also make sure that Komodo is listening; Debug > Listen for Debugging Connections.

At this point you should see a problem;  "Hey, WTF Carey?  I'm already running
Komodo while editing these files.  Do I restart Komodo and have it debug itself
in the same instance?  Won't Komodo lock up when it hits a breakpoint?"  And the
answer to that is "Word", or "Yes it will".

You're going to start a second Komodo instance using the commandline and the
**KOMODO_USERDATADIR** environmental variable.  "set" KOMODO_USERDATADIR in the
commandline then start Komodo from the same commandline terminal window by executing
*ko.exe* in the Komodo installs root directory.  We'll call this instance the
**secondary instance** or **SI**.  We'll call the original **primary instance**.
Guess what it's acronym will be.

Once Komodo **SI** has start, configure a Publishing account and try pushing a file.
This should immediately trigger a debugging request alert box to pop up in Komodo
**PI**.  Click "Yes" and start walking through the code using the Komodo **PI**
debugger.

That's about sums it up.  Try placing breakpoints through out the code and have fun.

Till next time!