---
title: Debug Komodo with Komodo
author: Carey Hoffman
date: 2014-08-14 06:00
tags: [debugging, python, Komodo IDE, remote debugging]
description: Ever wondered what's going on in there when you're working with Komodo?  Ever wondered how a component works?  Well why not walk through the code as Komodo does?
---

<div class="push-right toc">
    <ul>
        <li>
            <a href="#context">Context and Packages</a>
        </li>
        <li>
            <a href="#add_debugging">Add JIT to Komodo</a>
        </li>
        <li>
            <a href="#try_it">Try It Out</a> 
        </li>
    </ul>
</div>

Recently I was providing support to a customer who was having issues with a Komodo
component.  Unfortunately, when that component was originally written, logging was
added but it lacked any debug statements.  So asking the user to enable debug level logging
for the component didnt help much.  

I had been testing remote Python debugging
in Komodo just before so I decided to try a trick I'd heard about from Komodo 
Developer Mark Yen, to debug Komodo using Komodo.  It took a little bit of head 
scratching but given that I knew remote debugging fairly well it was just a matter 
of putting all the pieces into the right place.  That's what I'm going to share with
you.  Remote debugging Komodo's Python code, using Komodo.

<a name="context"/>
## Context and Packages  
To allow remote Python debugging you need to add the Komodo debugging package to
the language path.  The Python debugging package can be found either in your Komodo
install *(Komodo Install Dir)/lib/support/dbgp*, or on the [ActiveState Code](http://code.activestate.com/komodo/remotedebugging/) section.

As many of you probably know, Komodo runs primarily on two dynamic languages:
Javascript and Python.  Komodo ships with its own siloed Python to make our lives
easier.  It's a standard...ish Python install.  The [Komodo Python remote debugging docs](http://docs.activestate.com/komodo/latest/debugpython.html#Installing_the_Python_Remote_Debugger)
tell you to add the **dbgp** package location to the PythonPath but as far as I know,
we don't easily have control over that in Komodo's world.

Since Komodo's Python is a pretty standard Python install, I decided to do the wrong
thing and just add the dbgp package to *(Komodo Install Dir)/lib/Python/Lib/site-packages/*.
Now Komodo will find it on startup.

That's a good start so far.

<a name="add_debugging"></a>
## Add JIT to Komodo (add debugging)
Now that we have the debugging package installed in Komodo's siloed Python, we 
have access to the debugger.  But now what?  We can't click *Go* in Komodo the
component file...can I?

No, no you can't.  Komodo is already running so the code can be started again.  
Besides, it's impossible to start debugging Komodo in that traditional manner 
since it's the Mozilla framework (mostly C++) that does the initial object 
creation and launching of various Python components.

What we need here is [Just in Time (JIT) debugging](http://docs.activestate.com/komodo/latest/debugpython.html#debugpython_dbgpclient_functions)
provided by *dbgp.client.brk()*.  This allows us to trigger a breakpoint in our
running code and cause Python to request a debugging session from the Komodo 
you point it at.  

We are CLOSE now.

<a name="try_it"/>
## Try It Out 
When I started fiddling with this I was digging into the Publishing
 code so let's plug some breakpoints in there.  The [Publishing Tool in Komodo IDE](http://docs.activestate.com/komodo/latest/publish.html#publish_top)
is integrated into the source as an "extension" of Komodo.  You can find it's
source at *(Komodo Install Dir)/lib/mozilla/extensions/publishing@ActiveState.com/components/*.
You'll start by importing **brk** from the **dbgp** package.  I do this at the
top of the file, force of habit:
```python
from dbgp.client import brk  ### added dbgp.client.brk CGCH
```
I then put a *brk()* function in the **pushLocalUri** function in **koPublishing.py**.
This SHOULD be around line 572.

```python
def pushLocalUri(self, uri, transferCallback=None, forcePush=False, pubSettings=None):
    brk(host="127.0.0.1", port=9005) ###  added breakpoint CGCH
```

When Komodo hits this *brk()* a debugging session will be requested. Make sure
you've got your Komodo set to listen on the correct **port** seen above: *Edit menu
(Komodo on mac) > Preferences > Debugging > Connection*.  Also make sure that
Komodo is listening: *Debug menu > Listen for Debugging Connections*.

At this point you should see a problem, "Hey, WTF Carey?  I'm already running
Komodo while editing these files.  Do I restart Komodo and have it debug itself
in the same instance?  Won't Komodo lock up when it hits a breakpoint?"  And the
answer to that is "Word", or "Yes it will".

You're going to start a second Komodo instance using the commandline and the
**KOMODO_USERDATADIR** environmental variable.  "set" or "export" (linux, OSX) KOMODO_USERDATADIR in the
commandline then start Komodo from the same commandline terminal window by executing
the Komodo binary in the Komodo installs root directory.  We'll call this instance the
**debugged instance**.  It is the instance you will be "walking"
through with the debugger.  We'll call the Komodo currently running the **debugger instance**.

You could also do what I'm doing;  Download the [latest Komodo 9 Alpha](http://komodoide.com/download/)
pre-release build and use that as the **debugger instance** instance.  For those of you from the
future, isn't the Commando (new Fast Open) feature awesome!?

Once Komodo **debugged instance** has started, configure a Publishing account with it and try
pushing a file. This should immediately trigger a debugging request alert box to
pop up in Komodo **debugger instance**.  Click "Yes" and start walking through the code using
the Komodo **debugger instance** debugger.

That about sums it up.  Try placing breakpoints throughout the Komodo Python and
have fun.

Till next time!
