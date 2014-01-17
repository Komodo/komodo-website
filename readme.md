http://komodo.github.io/komodo-website/

# Requirements

 * DocPad - http://docpad.org/
 * Bower - http://bower.io/
 * Grunt - http://gruntjs.com/

# How to Use

## Getting Started

* `git clone git@github.com:Komodo/komodo-website.git`
* `cd komodo-website`
* `npm update`
* `bower install`
* `docpad run`

## Testing Production

`docpad run --env static`

## Deploy to GitHub

`docpad deploy-ghpages --env static`

## Troubleshooting

9/10 times deleting the "out" folder and having it regenerate will resolve your
issues.
