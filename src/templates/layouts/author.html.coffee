defaultMeta =
    sidebar: "blog"
    classNames: "document-author"

@document = @_.extend defaultMeta, @document
text @partial('layouts/layout-wrap.html', @)
