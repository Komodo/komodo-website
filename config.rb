require 'helpers'
helpers Helpers

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "{year}-{month}/{title}/index.html"
  blog.default_extension = ".md"
  blog.sources = "{year}-{month}-{title}.html"
  blog.paginate = true
  blog.per_page = 10
end

activate :similar

activate :directory_indexes

configure :development do
  activate :livereload
  set :site_url, "http://dev.komodoide.com:4567/"
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layouts_dir, "templates/layouts"
set :partials_dir, 'templates/partials'

page "*", :layout => "default"
page "/blog/*", :layout => "blog"

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
