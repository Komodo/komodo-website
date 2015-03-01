###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

require 'helpers'
helpers Helpers

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "blog/{year}-{month}/{title}/index.html"
  blog.default_extension = ".md"
  blog.sources = "blog/{year}-{month}-{title}.html"
end

activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  set :site_url, "http://dev.komodoide.com:4567/"
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layouts_dir, "templates/layouts"
set :partials_dir, 'templates/partials'

page "*", :layout => "default"

set :title, "Komodo IDE"

set :description, "One IDE, All Your Favourite Languages. Komodo is the "\
                  "professional IDE for major web languages, including Python,"\
                  "PHP, Ruby, Perl, HTML, CSS and JavaScript."

set :social_description, "Check out @KomodoIDE! One IDE for all major web languages."

set :keywords, "komodo,komodo ide,activestate komodo ide,activestate komodo ide 6,"\
                "activestate komodo,activestate ide,comodo ide,activestate"\
                "comodo,kumodo ide,active state komodo,perl komodo ide,ide"\
                "software,perl ide,python ide,ide python,tcl ide,integrated"\
                "development environment,development environment,activetstate,komodo"\
                "linux,komodo mac"

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

after_configuration do
  sprockets.append_path File.join root, 'bower_components'
end
