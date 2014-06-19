---
title: Working With Node.JS Through Vagrant, Puppet and VirtualBox
author: Carey Hoffman
date: 2014-06-19
tags: [virtualbox, vagrant, puppet, docpad]
description: How I launched a development environment for the Komodo website (or any docpad site) using Vagrant, Puppet and Virtualbox.
layout: blog
---

When [Nathan Rijksen][1] created the [new Komodo website using docpad][2],
it allowed for a much more developer friendly way to make changes to the site.
You'd need to have a development environment setup to test your changes locally
but that's not an issue.. unless you're like me and work mainly in Windows.
It doesn't help that I've had very little experiences with node.js (which is what
docpad was made width) prior to getting started. I had configured a VM to work
on the website, but doing that each time I switched to a new environment or somehow
nuked my VM seemed silly.  Luckily, I had just learned to use Puppet with
Vagrant so I saw a path to easily get things running.

## The Technology

To do this I used 3 pieces of technology:

 1. [Vagrant deployment utility][Vagrant]
 2. [Puppet orchestration][Puppet]
 3. and the [VirtualBox Hyper-visor][Virtualbox]

Using [Puppet] with [Vagrant], it was easy to keep the work separated into two
distinct groups; VM configuration and  guest environment configuration. Thankfully all
these technologies play together quite nicely, save for one minor issue that
had me stumped. At some point after [Virtualbox] version 4.16 was released,
Oracle disabled symlink creation in shared folders. But we're using Nodejs and
npm soooo, we need symlinks. Thankfully Oracle allowed for this to be enabled
using a [VBoxInternal2 setting](https://github.com/Komodo/komodo-website/commit/c65becde7cadc19ae2256e1b4d984169dfae1105#diff-23b6f443c01ea2efcb4f36eedfea9089R15).

### Vagrant
[Vagrant] was ridiculously easy to use.  [Their docs get your started in no time][7].
You can see [my vagrant file on github][8].

I used the Vagrantfile to configure my virtual machine before it starts. I set a
name and small memory footprint for the VM.

### Puppet

Using [Puppet] to install packages made my life pretty easy. [Puppet] has a great
resource in the Puppet-Labs open source community.  It not only has [documentation][puppet-docs]
but also the [puppet forge][puppet-forge] where you can find and download [Puppet]
modules for almost any task.  You can usually find a branch of each project
on github too. I added the pupper modules I needed as sub-modules to the Komodo-Website
repository to keep things manageable.

## Work Flow

Now it's as easy as pulling the [Komodo-website repository][ko-website] and
running ```vagrant up``` in the repository root and I have a development
environment for the website. 

Given that it was 3 tools I was learning, there was a slight learning curve.
But now that it's setup and I've got a basic understanding of how the tools
work, it's been easy to make changes to the site.

## Issues Resolved

 *  "bower install" Failing when nothing else was failing

    Puppet's not always forthcoming with it's error output.  To figure out an issue with
    `ko-bower-install` class in [development.pp][9] I ended up appending `2> help.log` to
    the command being run and finally found out that `Puppet` Exec commands are run as
    root

 * Symlink errors during `npm install` AKA. STUMPED ^^^
 
    This either means you didn't [set the VBox variable to enable Symlinks][5] OR you're
    not running your Windows CMD window (so VBOX implicitly) as **Administrator**.
    If you're trying to run the Komodo Website; the variable is set in the Vagrantfile
    so you're probably doing the latter.

 * default: Error: Connection timeout. Retrying...
    You'll see this while trying to `vagrant up --provision` your VM.  This is usually
    only a problem if you're actively developing your Vagrant/Puppet setup.

    I found the [solution on (surprise!) Stackoverflow][3].  The answer from [harrie][4]
    is a little bit of VBox command line voodoo which I think is way more fun than any
    of the other answers.

  [1]: /authors/#NathanRijksen
  [2]: /blog/2014-05/the-state-of-static-site-generators/
  [3]: http://stackoverflow.com/questions/22575261/vagrant-stuck-connection-timeout-retrying
  [4]: http://stackoverflow.com/a/23095019/1596011
  [5]: https://www.virtualbox.org/ticket/10085#comment:14
  [6]: https://github.com/Komodo/komodo-website/commit/05e93bd5fc435f475c7048dc4b4fa7f9566e949c
  [7]: https://docs.vagrantup.com/v2/getting-started/
  [8]: https://github.com/Komodo/komodo-website/blob/master/Vagrantfile
  [9]: https://github.com/Komodo/komodo-website/blob/master/puppet/manifests/development.pp
  [Vagrant]: http://www.vagrantup.com/
  [puppet]: http://puppetlabs.com/
  [Virtualbox]: https://www.virtualbox.org/
  [ko-website]: https://github.com/Komodo/komodo-website
  [puppet-docs]: http://docs.puppetlabs.com/
  [puppet-forge]: https://forge.puppetlabs.com/
