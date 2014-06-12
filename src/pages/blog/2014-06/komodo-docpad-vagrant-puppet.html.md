---
title: Komodo Website Development Deploy
author: Carey Hoffman
date: 2014-05-28
tags: [virtualbox, vagrant, pupper, shared folder, SharedFoldersEnableSymlinksCreate, docpad]
description: Launch a development environment for the Komodo website (or any docpad site) using Vagrant, Puppet, Virtualbox
layout: blog
---

When [Nathan Rijksen][1] moved the [Komodo website to docpad][2]
it allowed for a much more fun way to make changes to the site.  You have to have
a development environment setup to test the changes locally but that's not an
issue...unless you're like me and work mainly in Windows and had never used Node
on Windows (although this is handy for quick setup on Linux machines too).  Of
course, I congiured a VM to work on the website, but doing that again any time I
came to a new environment or some how I hooped my VM seemed silly.  I had just
learned to use Puppet in with Vagrant so I path to easily set this up.

## The Pieces

Too pull this off I used 3 pieces.  Vagrant deployment, Puppet ochestration, and the
VirtualBox Hypervisor.  Thankful all these technology play quite nicely together,
save for one minor issue that had me stump for days...I'll explain later.

## The Process

Using Puppet with Vagrant, it was easy to keep the work separated into two disctinct
groups; VM configuration and environment configuration.

I use the Vagrantfile to configure the Machine before it started.  I kept it minimal.
I set a name and small memory footprint for the VM.  At some point after VBox
version 4.16 was released, Oracle disabled symlink creation in shared folders.
Makes sense.  Their implementation of Shared Folders allowed symlinks to be created
to folders outside the guest, into the host.  That's no fun but we're using Nodejs
and NPM soooo, we need symlinks.  Thankfully Oracle allowed for this to be disabled
using a VBoxInternal2 setting (USE GIT COMMIT REFERECNE LINK HERE)7

Using Puppet to install packages made my life pretty easy.  Puppet has a great
resource in Puppet-Labs.  For the most part, you can find a branch of each project
on github so I just added them as submodules to the Komodo-Website repo to keep
things manageable.

## Work Flow

Now it's as easy as pulling the Komodo-website repo and running ```vagrant up```
in the repo root (where the Vagrantfile lives) and I have a dev environment for
the website.  That's assuming I already have Vbox installed and Vagrant.  The
former I always do. The latter, not quite as often.  

Given that it was 3 tools I was learning, there was definitely a learning curve
here.  Now that it's setup and I've got a basic understanding of how the tools
work it's been really easy to accomodate changes to the site.  Nathan [removed the Ruby dependancy by replacing SASS with Node-SASS][6].
This just meant removing the Ruby and bundler submodules in Puppet and deleting
them out of the puppet/development.pp manifest and rebuilding the site.  Granted,
the ease of use can be attributed to Nathan's choice of packaging tools and
packages.

## Known Issues

###Symlink errors during ```npm install```
This either means you didn't [set the VBox variable to enable Symlinks][5] OR you're
not running your Windows CMD window as '''Administator'''.  The variable is set
in the Vagrantfile for the Komodo website already so you're probably doing the
latter.

###default: Error: Connection timeout. Retrying...###
You'll see this while trying to ```vagrant up --provision``` your VM.  This is
only usually a problem if you're actively developing your Vagrant/Puppet setup
but chances are, people will find this and maybe (hopefull!) find it useful and
bend it to their will in which case, you will more than likely hit this error.

I found the [solution on (surprise!) Stackoverflow][3].  The answer from [harrie][4]
is a little bit of VBox commandline voodoo which I think is way more fun than any
of the other answers

## The Solution

Most of these limitations seem to boil down to the same issue; regeneration is
costly. This isn't an issue for most CMSes, since pages are generated in
real-time (when you visit a page on a website, it is generated at that time for
your specific visit). Can't we meet somewhere in the middle though? Actually,
we can! The way I see it, most static site generators are essentially a very
strong caching system. There is no reason we can't invalidate our content at
runtime and have it regenerate for one reason or another - but we don't want our
entire site to regenerate every time!

So what if we borrow a little bit from the CMS systems; we preserve the static
site generator functionality while adding a small dynamic piece in between which
simply checks whether our content is still up-to-date or whether it needs to be
regenerated. We then either pass off the request to the up-to-date static file or
re-generates the file on the fly.

But - how can we regenerate a file on the fly if the entire site is being
regenerated and we therefore have to wait for this entire process to finish?
Well why does the entire site need to be regenerated? Because files are
inter-connected, that's why! Do'h. But hold on, can't we intelligently decide
"which" files are connected, and prioritize the generation of the file that we
actually need, whilst letting the rest of the files regenerate in the background
without bothering the end-user? We totally can! And this is what I would like to
see happen in the future, and is something that [has already been recognized
(to an extent) in DocPad][4] and likely in other static site generators as well.

## The Future

So for me, the future is very bright. I don't anticipate that I won't ever touch
a CMS again; as I said static site generators do not replace them, they merely
offer an alternative approach which will be relevant in some cases, and not in
others. And I look forward to seeing their relevancy increase.


  [1]: /authors/#NathanRijksen
  [2]: /blog/2014-05/the-state-of-static-site-generators/
  [3]: http://stackoverflow.com/questions/22575261/vagrant-stuck-connection-timeout-retrying
  [4]: http://stackoverflow.com/a/23095019/1596011
  [5]: https://www.virtualbox.org/ticket/10085#comment:14
  [6]: https://github.com/Komodo/komodo-website/commit/05e93bd5fc435f475c7048dc4b4fa7f9566e949c
