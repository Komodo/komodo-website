defaultMeta =
    articleTemplate: "article-blog"
    sidebar: "blog"
    classNames: "document-blog-entry"
    comments: true

@document = @_.extend defaultMeta, @document
text @partial('layouts/layout-wrap.html', @)
