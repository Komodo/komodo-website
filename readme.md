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

## Requirements

* Vagrant
* Virtual Box

## Installation

1. from the root of the Komodo-website repo; `vagrant up`
  * Starts an Ubuntu VM and provisions it based on our puppet configuration

2. when provisioning completes and the VM is running; `vagrant ssh`
  * SSH into the VM as the `vagrant` user and dropped in a shell terminal

3. `cd /vagrant`

4. `ip addr show eth1 | grep inet | awk '{ print $2 }' | awk -F "/" '{print $1}'`
  * output the IP of network interface eth1 to use in step 7.

5. `bower install`

6. `docpad run`

7. on the host machine edit your /etc/hosts file to point dev.komodoide.com to the IP address
retrieved in step 4:
`192.168.69.68 dev.komodoide.com`
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

## Deploy to GitHub

`docpad clean && docpad deploy-ghpages --env static`

## Troubleshooting

9/10 times deleting the "out" folder and having it regenerate will resolve your
issues.
