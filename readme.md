<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Vagrant Install (recommended)](#vagrant-install-recommended)
	- [Requirements](#requirements)
	- [Installation](#installation)
	- [Management](#management)
		- [Stopping Vagrant VM](#stopping-vagrant-vm)
		- [Restart Vagrant VM and server](#restart-vagrant-vm-and-server)
		- [Notes](#notes)
- [Manual Install](#manual-install)
	- [Requirements](#requirements-1)
	- [Installation](#installation-1)
- [Usage](#usage)
	- [Development Notes](#development-notes)
	- [Testing Production](#testing-production)
	- [Deploy to GitHub](#deploy-to-github)
	- [Troubleshooting](#troubleshooting)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Vagrant Install (recommended)

**NOTE:** Using the Vagrant process, Vagrant will download a 290 MB Ubuntu Precise image onto your machine from files.vagrantup.com the first time you run _vagrant up_.  On a 14 Mbps connection this can take appoximately 3 minutes.

## Requirements

* Vagrant
* Virtual Box

## Installation

1. from the root of the Komodo-website repo; `vagrant up`
  * This will install git and allow the VM to have an IP routable in your internal
  DNS (ie. 192.168.x.x).

2. when provisioning completes and the VM is running; `vagrant ssh`
  * SSH into the VM as the `vagrant` user and dropped in a shell terminal

3. `cd /vagrant`

4. Rsync the contents of this folder to the vagrant users home folder using this command"
    `*vagrant@komodo:/vagrant$ rsync -vr --exclude .git --exclude puppet --exclude out --exclude .vagrant . ~`

4. `ip addr show eth1 | grep inet | awk '{ print $2 }' | awk -F "/" '{print $1}'`
  * output the IP of network interface eth1 to use in step 7.

5. `bower install`

6. `docpad run`

7. on the host machine edit your /etc/hosts file to point dev.komodoide.com to the IP address
retrieved in step 4:
`192.168.0.101 dev.komodoide.com`
  * on Windows you can find your `hosts` file under `C:\Windows\System32\drivers\etc`, on mac/linux it is under `/etc/hosts`
  * on windows it is best to edit it using Notepad opened "as administrator"

*You can now hit __dev.komodoide.com:9778__ in your browser and view the Komodo Website*

## Management

### Stopping Vagrant VM
On the host machine run:
* `vagrant halt`

### Restart Vagrant VM and server
On the host machine run:
* `vagrant run`
* `vagrant ssh`
* `cd /vagrant && docpad run`

__NOTE: The VM environment remains provisioned after the first `vagrant run`.
You only need to run the server now__

### Notes
The folder that the Vagrantfile is located in on the *host* is a special folder
and is linked directly to the `/vagrant` folder inside the VM.  


# Manual Install

## Requirements

 * DocPad - http://docpad.org/
 * Bower - http://bower.io/
 * Grunt - http://gruntjs.com/

## Installation

* `git clone https://github.com/Komodo/komodo-website.git`
* `cd komodo-website`
* `npm install`
* `bower install`
* `docpad run`

# Usage

Run the docpad server: `docpad run`

Access your dev enviroment using: http://dev.komodoide.com/

If you are accessing your dev environment from an external
machine you will need to set up dev.komodoide.com in your hosts file.

## Development Notes

Because of https://github.com/bevry/docpad/issues/336 there are some temporary
workarounds to make development faster. In particular all blogs before 2013-09
are excluded from being generated when on a development environment. Additionally
some files may fail to re-render properly (particularly while working with templates).

These are temporary workarounds in the interest of productivity.

## Testing Production

`docpad run --env dev-static`

## Testing Resources

The resources section is currently in beta and is not enabled by default on
a development environment. To test it you need to remove the resources plugin
from the disabled plugins list in docpad.coffee and remove the "pages\/resources.html"
pattern from ignoreCustomPatterns.

You will also need to install the *github-markup* gem for the readme's to parse.

## Deploy to GitHub

`docpad clean && docpad deploy-ghpages --env static`

## Troubleshooting

9/10 times deleting the "out" folder and having it regenerate will resolve your
issues.
