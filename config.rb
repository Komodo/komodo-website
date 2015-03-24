require 'helpers'
helpers Helpers

#activate :imageoptim

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

pageable = {}

if data.has_key? "blog"
  data.blog.posts.each do |id, post|
    if /^\d{4}-\d{2}-/.match(post["slug"])
      post["slug"] = post["slug"].sub(/^(\d{4}-\d{2})-/,'\1/')
    end
    
    proxy "/blog/#{post["slug"]}/index.html", "templates/proxy/blog.html", :locals => { :post => post, :custom_meta => post }, ignore: true
  end
  
  pageable["blog"] = data.blog.posts
                      .reject { |k,v| v.tags.include? "press" }
                      .sort_by { |k,v| v["date"] }
                      .reverse
  
  tags().each() do |name,posts|
    proxy "/blog/tagged/#{name}/index.html", "templates/proxy/tag.html", :locals => { :tag_name => name, :posts => posts }, ignore: true
  end
end

if data.has_key? "resources"
  all = []
  
  categories = {}
  data.resources.categories.each() do |category|
    categories[category.resource[0..-5]] = category
  end
  
  data.resources.each() do |category,resources|
    if category == 'categories'
      next
    end
    
    pageable[category] = resources
    
    if ['all','downloads','popular'].include? category
      next
    end
    
    resources.each() do |resource|
      slug = get_resource_slug(resource)
      proxy "/resources/#{category}/#{slug}/index.html", "templates/proxy/resource.html", :locals => { :resource => resource, :category => categories[category] }, ignore: true
    end
    
  end
end

activate :pagination do
  pageable.each() do |name,data|
    pageable_set name do
      data
    end
  end
end

activate :komodo_resources

activate :directory_indexes

activate :deploy do |deploy|
  deploy.method = :git
end

configure :development do
  activate :livereload
  set :is_live, false
  set :site_url, "http://dev.komodoide.com:4567"
end

configure :build do
  is_qa = ENV["KO_QA"] == "true"
  set :is_live, ! is_qa
  set :site_url, is_qa ? "http://qa.komodoide.com" : "http://komodoide.com"
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layouts_dir, "templates/layouts"
set :partials_dir, 'templates/partials'

page "*", :layout => "default"
page "json/*", :layout => false
page "assets/*", :layout => false

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
end

after_configuration do
  sprockets.append_path File.join root, 'bower_components'
end
