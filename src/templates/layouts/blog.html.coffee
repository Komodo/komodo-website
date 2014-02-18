defaultMeta =
    articleTemplate: "article-blog"
    sidebar: "blog"
    classNames: "document-blog-entry"
    comments: true

if @document.update_from_drupal
    defaultMeta.classNames += " drupal-import"

@document = @_.extend defaultMeta, @document
text @partial('layouts/layout-wrap.html', @)
