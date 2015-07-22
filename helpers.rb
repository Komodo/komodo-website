module Helpers
  
  def get_effective_title(page_title)
    
    if current_page.data.title
      if get_basename() == "index" 
        return current_page.data.title
      else
        return current_page.data.title
      end
    end
    
    if page_title
      return page_title
    end
    
    return title
    
  end
  
  def get_title(page_title)
    
    effective_title = get_effective_title(page_title)
    
    if current_page.data.title and get_basename() == "index"
      return effective_title
    end
    
    return "#{effective_title} | #{title}"
    
  end
  
  def get_social_description(page_title, via = true)
    if current_page.data.socialDescription
      return current_page.data.socialDescription
    end
    
    page_title = get_effective_title(page_title)
  
    if meta('layout') == 'blog' and via
      return page_title + ' via @KomodoIDE'
    end
    
    unless page_title.include? "Komodo"
      page_title = page_title + " | Komodo IDE"
    end
    
    return page_title
  end
  
  def get_basename()
    return File.basename(current_page.path, ".*" )
  end
  
  def meta(name, post = false)
    if current_page.data.has_key?(name)
      return current_page.data[name]
    else
      if name == "image"
        if post and post.has_key?("featuredImage") and post.featuredImage.has_key?("url")
          return (post.featuredImage.url.start_with?("http") ? "" : "http:") + post.featuredImage.url
        end
      end
      return false
    end
  end
  
  def get_pages_by_layout(layout)
    pages = Array.new
    sitemap.where(:layout.equal => layout).all().each() do |page|
      pages.push page
    end
    pages = pages.sort_by do |page|
      page.data.date
    end
    return pages.reverse()
  end
  
  def get_list(ob, classAttr = "")
    r = ['<ul class="' + (classAttr) + '">']
    ob.each do |value|
      if value.has_key?("link")
        if value["link"] == '/'
          value["link"] = site_url
        end
      else
        value["link"] = site_url + "/" + value["name"].downcase
      end
      
      value["link"] = value["link"].sub('{site.url}', site_url) 
      value["link"] = value["link"].gsub(/\s/,'-')

      if value.has_key?("sub")
        r.push '<li class="has-sub">'
      else
        r.push '<li>'
      end
      
      r.push "<a href='#{value["link"]}'"\
               " title='#{value["name"]}'"\
               " target='" + (value["target"] || "_self") + "'>"
      if value.has_key?("img")
        r.push "<img src='#{image_path(value["img"])}' alt='#{value["name"]}'/>"
      end
      r.push "<span class='link-name'>#{value["name"]}</span>"
      if value.has_key?("icon")
        r.push "<i class='icon icon-#{value["icon"]}'></i>"
      end
      r.push "</a>"
      if value.has_key?("name_append")
        r.push value["name_append"]
      end
      if value.has_key?("sub")
        r.push get_list(value["sub"])
      end
      r.push "</li>"
    end

    r.push "</ul>"
    r = r.join("\n")
    return r
  end
  
  def summary(text, length = 250)
    text = text.gsub(/^#+.*\n/,'') # Strip markdown headers
    text = text.gsub(/\[(.*?)\](?:\[.*?\])?(?:\(.*?\))?/,'\1') # Strip markdown links
    text = text.gsub(%r{</?[^>]+?>}, '').gsub(/\n+/,' ') # Strip html and line endings
    text = text.gsub('Macro Monday - a new macro to dig into every Monday!','')
    _text = text.split(/[!,.]/)
    if _text.first().length > length
      return text[0...250] + " [...]"
    end
    
    summary = _text.shift + "."
    _text.each() do |sentence|
      if summary.length + sentence.length > 250
        break
      end
      
      summary += sentence + "."
    end
    
    suffix = ""
    if (summary.length != text.length)
      summary = summary[0...summary.length-1]
      suffix = " [...]"
    end
    
    return text[0...summary.length] + suffix
  end
  
  def yaml(path)
    require 'yaml'
    return YAML.load_file(File.dirname(__FILE__) + path)
  end
  
  def markitdown(source)
    renderer = Redcarpet::Render::HTML.new(prettify: true)
    md = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, :smartypants => true)
    return md.render(source)
    #return Tilt['markdown'].new { source }.render()
  end
  
  @@vimeo_cache = {}
  
  def vimeo_data(id, attr)
    unless (@@vimeo_cache.has_key?(id))
      api_url = "http://vimeo.com/api/v2/video/%s.json" % id
      @@vimeo_cache[id] = JSON.parse(open(api_url).read).first
    end
    
    data = @@vimeo_cache[id]
    return data.has_key?(attr) ? data[attr] : nil
  end
  
  def tags()
    tags = {}
    posts = data.cntf.posts.sort_by { |k,v| v["date"] }.reverse
    posts.each() do |id,post|
      post.tags.each() do |tag|
        unless tags.has_key? tag
          tags[tag] = [];
        end
        
        tags[tag].push({
          "title" => post.title,
          "date" => post.date,
          "author" => post.author,
          "slug" => post.slug
        })
      end
    end
    
    return tags
  end
  
  def get_resource_slug(resource)
    slug = resource.title
    slug = slug.gsub(/\s*/,'')
    slug = slug.gsub(/[^A-Za-z0-9-]/,'')
    slug = resource.owner.login + "--" + slug
    
    return slug.downcase
  end
  
  def get_package_slug(resource)
    slug = resource.title
    slug = slug.gsub(/\s+/,'-')
    slug = slug.gsub(/[^A-Za-z0-9-]/,'')
    
    return slug.downcase
  end
  
  def timeago(time)
    return unless time
    time = Time.parse(time.to_s)
    
    a = (Time.now-time).to_i

    case a
      when 0 then 'just now'
      when 1 then 'a second ago'
      when 2..59 then a.to_s+' seconds ago' 
      when 60..119 then 'a minute ago' #120 = 2 minutes
      when 120..3540 then (a/60).to_i.to_s+' minutes ago'
      when 3541..7100 then 'an hour ago' # 3600 = 1 hour
      when 7101..82800 then ((a+99)/3600).to_i.to_s+' hours ago' 
      when 82801..172000 then 'a day ago' # 86400 = 1 day
      when 172001..518400 then ((a+800)/(60*60*24)).to_i.to_s+' days ago'
      when 518400..1036800 then 'a week ago'
      else ((a+180000)/(60*60*24*7)).to_i.to_s+' weeks ago'
    end
  end
  
  def get_recent_blogs()
    data.cntf.posts
      .reject { |k,v| v.tags.include? "press" }
      .sort_by { |k,v| v["date"] }
      .reverse
  end
end