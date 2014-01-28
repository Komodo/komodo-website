# Requirements

 * DocPad - http://docpad.org/
 * Bower - http://bower.io/
 * Grunt - http://gruntjs.com/
 * Ruby (for SASS & Compass)
   * Bundler

# How to Use

## Getting Started

* `git clone https://github.com/Komodo/komodo-website.git`
* `cd komodo-website`
* `npm update`
* `bundle install` 
* `bower install`
* `docpad run`

## Testing Production

`docpad run --env production`

## Deploy to GitHub

`docpad deploy-ghpages --env static`

## Troubleshooting

9/10 times deleting the "out" folder and having it regenerate will resolve your
issues.
