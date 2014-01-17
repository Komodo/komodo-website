_ = require 'underscore'
{requireFresh} = require 'requirefresh'

# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	regenerateDelay: 50

	watchOptions:
		catchupDelay: 0
	
	# live
	ignoreCustomPatterns: /public\/vendor|src\/databases|\/_/

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
	templateData:

		db:
			header: requireFresh(__dirname + '/src/databases/header.coffee')
			footer: requireFresh(__dirname + '/src/databases/footer.coffee')

		# Specify some site properties
		site:
			# The production url of our website
			url: "/"

			# Here are some old site urls that you would like to redirect from
			oldUrls: [
			]

			# The default title of our website
			title: "Komodo IDE"

			# The website description (for SEO)
			description: """

				"""

			# The website keywords (for SEO) separated by commas
			keywords: """

				"""


		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		getGruntedStyles: ->
			styles = []
			gruntConfig = require('./grunt-config.json')

			if docpad.getEnvironment() is "development"
				styles = gruntConfig.concat.css.src
			else
				_.each gruntConfig, (value, key) ->
					styles = styles.concat _.flatten _.pluck value, 'dest'
				styles = _.filter styles, (value) ->
					return value && value.indexOf('.min.css') > -1

			_.map styles, (value) ->
				return @site.url + value.replace 'out', ''

		getGruntedScripts: ->
			scripts = []
			gruntConfig = require('./grunt-config.json')
			
			if docpad.getEnvironment() is "development"
				scripts = gruntConfig.min.js.src
			else
				_.each gruntConfig, (value, key) ->
					scripts = scripts.concat _.flatten _.pluck value, 'dest'
				scripts = _.filter scripts, (value) ->
					return value && value.indexOf('.min.js') > -1

			_.map scripts, (value) ->
				return @site.url + value.replace 'out', ''

		getAsList: (ob, classAttr = "") ->
			latestConfig = docpad.getConfig()
			imgPath = latestConfig.templateData.site.url + "images/"

			r = ['<ul class="' + (classAttr) + '">']
			_.each ob, (value, key) ->

				r.push '<li><a href="' + (value.link || value.name.toLowerCase() + ".html") +
							'" title="' + value.name +
							'" target="' + (value.target || "_self") + '">'
				r.push '<img src="' + imgPath + value.img + '"/>' unless ! value.img
				r.push '<span class="link-name">' + value.name + '</span>'
				r.push latestConfig.templateData.getAsList(value.sub) unless ! value.sub
				r.push '</a></li>'

			r.push "</ul>"
			return r.join("");

	environments:
		development:
			ignoreCustomPatterns: /public\/vendor/
			templateData:
				site:
					url: "/"
		
		static: # ghpages
			templateData:
				site:
					url: "/komodo-website/"

	plugins:
		ghpages:
			deployRemote: 'origin'
			deployBranch: 'gh-pages'

	# =================================
	# DocPad Events

	# Here we can define handlers for events that DocPad fires
	# You can find a full listing of events on the DocPad Wiki
	events:

		# Server Extend
		# Used to add our own custom routes to the server before the docpad routes are added
		serverExtend: (opts) ->
			# Extract the server from the options
			{server} = opts
			docpad = @docpad

			# As we are now running in an event,
			# ensure we are using the latest copy of the docpad configuraiton
			# and fetch our urls from it
			latestConfig = docpad.getConfig()
			oldUrls = latestConfig.templateData.site.oldUrls or []
			newUrl = latestConfig.templateData.site.url

			# Redirect any requests accessing one of our sites oldUrls to the new site url
			server.use (req,res,next) ->
				if req.headers.host in oldUrls
					res.redirect(newUrl+req.url, 301)
				else
					next()

		# Write After
		# Used to minify our assets with grunt
		writeAfter: (opts,next) ->
			# Prepare
			docpad = @docpad

			rootPath = docpad.config.rootPath
			balUtil = require 'bal-util'

			# Make sure to register a grunt `default` task
			command = ["#{rootPath}/node_modules/.bin/grunt",
					   (if docpad.getEnvironment() is "development" then "development" else "default")]

			# Execute
			balUtil.spawn command, {cwd:rootPath,output:true}, ->
				unless docpad.getEnvironment() is "development"
					src = []
					gruntConfig = require './grunt-config.json'
					_.each gruntConfig, (value, key) ->
						src = src.concat _.flatten _.pluck value, 'src'
					_.each src, (value) ->
						balUtil.spawn ['rm', value], {cwd:rootPath, output:false}, ->
					balUtil.spawn ['find', '.', '-type', 'd', '-empty', '-exec', 'rmdir', '{}', '\;'], {cwd:rootPath+'/out', output:false}, ->
			
			next()

			# Chain
			@
}

# Export our DocPad Configuration
module.exports = docpadConfig
