---
title: Komodo Website Development Deploy
author: Carey Hoffman
date: 2014-05-28
tags: [virtualbox, vagrant, pupper, shared folder, SharedFoldersEnableSymlinksCreate, docpad]
description: Launch a development environment for the Komodo website (or any docpad site) using Vagrant, Puppet, Virtualbox
layout: blog
---

When [Nathan Rijksen][1] moved the [Komodo website to docpad][2],
it allowed for a much more development friendly way to make changes to the site.  You have
to have a development environment setup to test the changes locally but that's not
an issue. That is unless you're like me and work mainly in Windows.  It doesn't
help having had very little experiences with Node prior to getting started.  I
had configured a VM to work on the website, but doing that each time I
came to a new environment or somehow nuked my VM, seemed silly.  Luckily, I had just
learned to use Puppet with Vagrant so I saw a path to easily setting this up.

## The Pieces

To do this I used 3 pieces:
1. Vagrant deployment utility
2. Puppet orchestration
3. and the VirtualBox Hyper-visor.

Using Puppet with Vagrant, it was easy to keep the work separated into two distinct
groups; VM configuration and environment configuration.  Thankfully all these technologies play quite nicely together, save for one minor
issue that had me stumped.  

###Vagrant
Vagrant was ridiculously easy to use.  [Their docs get your started in no time][7].
You can see [my vagrant file on github][8].

I used the Vagrantfile to configure virtual machine before it started.  I set a name and small memory footprint for the VM.

At some point after VBox version 4.16 was released, Oracle disabled symlink creation
in shared folders.  Makes sense.  Their implementation of Shared Folders allowed
symlinks to be created to folders outside the guest into the host.  That's no
fun but we're using Nodejs and npm soooo, we need symlinks.  Thankfully Oracle
allowed for this to be enabled using a VBoxInternal2 setting (USE GIT COMMIT
REFERECNE LINK HERE)7

### Puppet

Using Puppet to install packages made my life pretty easy.  Puppet has a great
resource in Puppet-Labs.  For the most part, you can find a branch of each project
on github.  I added them as sub-modules to the Komodo-Website repository to keep
things manageable.

## Work Flow

Now it's as easy as pulling the Komodo-website repository and running ```vagrant up```
in the repository root (and maybe a couple more commands) and I have a development
environment for the website.  That's assuming I already have Vbox installed and
Vagrant.  The former I always do. The latter, not quite as often.  

Given that it was 3 tools I was learning, there was a slight learning curve.
Now that it's setup though and I've got a basic understanding of how the tools
work, it's been easy to accommodate changes to the site.  Nathan [removed the Ruby dependancy by replacing SASS with Node-SASS][6].
This just meant removing the Ruby and bundler sub-modules in Puppet and deleting
them out of the puppet/development.pp manifest then rebuilding the site.  Granted,
the ease of use can be attributed to Nathan's choice of packaging tools and
packages aswell.

## Issues Resolved

###"bower install" Failing when nothing else was failing
Puppet's not always forthcoming with the error output.  To figure out an issue with
```ko-bower-install``` class in [development.pp][9] I ended up appending '''2> help.log''' to
the command being run and finally found out that Puppet Exec commands are run as
root and Bower has issues with that:
'''If you're having permission errors when using bower without sudo, please spend a
few minutes learning more about how your system should work and make any necessary
repairs.'''

###Symlink errors during ```npm install``` AKA. STUMPED ^^^
This either means you didn't [set the VBox variable to enable Symlinks][5] OR you're
not running your Windows CMD window (so VBOX implicitly) as '''Administrator'''.
The variable is set in the Vagrantfile for the Komodo website already so you're
probably doing the latter. 

###default: Error: Connection timeout. Retrying...###
You'll see this while trying to ```vagrant up --provision``` your VM.  This is
only usually a problem if you're actively developing your Vagrant/Puppet setup.

I found the [solution on (surprise!) Stackoverflow][3].  The answer from [harrie][4]
is a little bit of VBox command line voodoo which I think is way more fun than any
of the other answers

## TODOs

*Right now you need to manually create a symlink to the docpad executable into
/usr/local/node/node-default/bin which shouldn't be necessary.
*The class in Puppet that runs ```bower install``` does nothing


  [1]: /authors/#NathanRijksen
  [2]: /blog/2014-05/the-state-of-static-site-generators/
  [3]: http://stackoverflow.com/questions/22575261/vagrant-stuck-connection-timeout-retrying
  [4]: http://stackoverflow.com/a/23095019/1596011
  [5]: https://www.virtualbox.org/ticket/10085#comment:14
  [6]: https://github.com/Komodo/komodo-website/commit/05e93bd5fc435f475c7048dc4b4fa7f9566e949c
  [7]: https://docs.vagrantup.com/v2/getting-started/
  [8]: https://github.com/Komodo/komodo-website/blob/master/Vagrantfile
  [9]: https://github.com/Komodo/komodo-website/blob/master/puppet/manifests/development.pp
  