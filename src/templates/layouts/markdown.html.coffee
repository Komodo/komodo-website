defaultMeta =
    classNames: "markdown"

@document = @_.extend defaultMeta, @document
text @partial('layouts/layout-wrap.html', @)
