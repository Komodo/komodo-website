require 'helpers'
helpers Helpers

activate :imageoptim

set :url_root, "http://komodoide.com/"
activate :search_engine_sitemap

contentful_space = {blog: ENV['CONTENTFUL_SPACE']}
contentful_token = ENV['CONTENTFUL_TOKEN']

activate :contentful do |cntf|
  cntf.space         = contentful_space
  cntf.access_token  = contentful_token
  cntf.cda_query     = { }
  cntf.content_types = { posts: '2wKn6yEnZewu2SCCkus4as',
                         authors: '1kUEViTN4EmGiEaaeC6ouY' }
end

if data.has_key? "blog"
  data.blog.posts.each do |id, post|
    if /^\d{4}-\d{2}-/.match(post["slug"])
      post["slug"] = post["slug"].sub(/^(\d{4}-\d{2})-/,'\1/')
    end
    
    proxy "/blog/#{post["slug"]}/index.html", "templates/proxy/blog.html", :locals => { :post => post, :custom_meta => post }, ignore: true
  end
  
  activate :pagination do
    pageable_set :blog do
      data.blog.posts.sort_by { |k,v| v["date"] }.reverse
    end
  end
  
  tags().each() do |name,posts|
    proxy "/blog/tagged/#{name}/index.html", "templates/proxy/tag.html", :locals => { :tag_name => name, :posts => posts }, ignore: true
  end
end
activate :directory_indexes

configure :development do
  activate :livereload
  set :site_url, "http://dev.komodoide.com:4567"
end

configure :build do
  set :site_url, "http://komodoide.com"
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

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :file_watcher_ignore, [
   /^bower_components(\/|$)/,
  /^\.sass-cache(\/|$)/,
  /^\.cache(\/|$)/,
  /^\.git(\/|$)/,
  /^\.gitignore$/,
  /\.DS_Store/,
  /^Gemfile$/,
  /^Gemfile\.lock$/,
  /~$/,
  /(^|\/)\.?#/,
  /^tmp\//,
  /^build(\/|$)/
]

ignore 'templates/*'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

after_configuration do
  sprockets.append_path File.join root, 'bower_components'
end
