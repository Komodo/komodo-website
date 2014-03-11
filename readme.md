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
