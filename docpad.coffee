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

	env: "development"

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ
	templateData:

		_: require('underscore')

		db:
			config: requireFresh(__dirname + '/src/databases/config.coffee')
			header: requireFresh(__dirname + '/src/databases/header.coffee')
			footer: requireFresh(__dirname + '/src/databases/footer.coffee')
			placeholders: requireFresh(__dirname + '/src/databases/placeholders.coffee')

		# Dirtyyy.. TODO: clean up
		youtubeFeedItems: requireFresh(__dirname + '/src/databases/placeholders.coffee').screencasts

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
				styles = _.flatten gruntConfig.cssmin.combine.files
			else
				minify = gruntConfig.cssmin.minify
				_.each minify.src, (value) ->
					styles.push minify.cwd + value.replace(/.css$/, minify.ext)

			site = @site
			_.map styles, (value) ->
				site.url + value.replace 'out/', ''

		getGruntedScripts: ->
			scripts = []
			gruntConfig = require('./grunt-config.json')

			if docpad.getEnvironment() is "development"
				scripts = _.flatten gruntConfig.uglify.scripts.files
			else
				scripts = _.keys gruntConfig.uglify.scripts.files

			site = @site
			_.map scripts, (value) ->
				site.url + value.replace 'out/', ''

		getAsList: (ob, classAttr = "") ->
			latestConfig = docpad.getConfig()
			imgPath = @site.url + "images/"

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
					url: "/"


	collections:
		splash: ->
			@getCollection('documents').findAllLive({relativeOutDirPath:'splash'}, [basename: 1])

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

		generateBefore: (opts,next) ->
			if docpad.getEnvironment() is "development"
				next()
				return @

			try
				latestConfig = docpad.getConfig()

				# Generate Youtube Feed Data
				feedParser = require 'fast-feed'
				request = require 'request'

				request(latestConfig.templateData.db.config.youtube.screencasts, (error, response, body) ->
					items = feedParser.parse(body).items
					_.each items, (item) -> item.id = item.link.match(/watch\?v=([a-z0-9]*?)\&/i)[1]
					latestConfig.templateData.youtubeFeedItems = items
					next()
				)
			catch e
				console.log e

			@

		# Generate Screencast pages
		# TODO: Cleanup and turn into plugin
		renderBeforePriority: 550
		renderBefore: (opts,next) ->
			try
				docpad = @docpad
				{collection,templateData} = opts
				database = docpad.getDatabase()

				latestConfig = docpad.getConfig()
				templateDoc = docpad.getCollection('documents').findOne(
					filename: "screencast.html.eco"
					relativeOutDirPath: "screencasts"
				)

				feed = latestConfig.templateData.youtubeFeedItems

				renderFile = (index) ->
					item = feed[index]

					doc = docpad.cloneModel templateDoc

					filename = item.id + ".html"
					attr =
						basenameOrig: doc.get "basename"
						title: item.title
						outFilename: filename
						outPath: doc.get("outDirPath") + "/" + filename
						fullPath: null # treat it as a virtual document
						relativePath: doc.get("relativeDirPath") + "/" + filename
						filename: filename
						outFilename: filename

					doc.set attr
					doc.set "screencast", item
					doc.setMeta attr

					doc.normalize (err) ->
						# Check
						return _next(err) if err

						# Add it to the database
						collection.add(doc)
						database.add(doc)

						_next()

				renderedItems = 0
				_next = (err) ->
					if err or renderedItems == feed.length
						next(err)
					else
						renderFile(renderedItems++)

				_next()

			catch e
				console.log e

			@

		# Write After
		# Used to minify our assets with grunt
		writeAfter: (opts,next) ->
			# Prepare
			docpad = @docpad

			rootPath = docpad.config.rootPath
			balUtil = require 'bal-util'

			# Make sure to register a grunt `default` task
			command = ["#{rootPath}/node_modules/.bin/grunt", docpad.getEnvironment()]

			# Execute
			balUtil.spawn command, {cwd:rootPath,output:true}, ->
				# TODO: Cleanup?
				next()

			# Chain
			@
}

# Export our DocPad Configuration
module.exports = docpadConfig
