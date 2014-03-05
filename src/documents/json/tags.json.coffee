return if docpad.getEnvironment() == 'development'

tags = {}
maxWeight = 0
docpad.getCollection('blog').forEach (document) =>
    for tag in (document.get('tags') or [])
        tags[tag] = {name: tag, documents: [], weight: 0} unless tags[tag]
        tags[tag].documents.push {
            title: document.attributes.title
            date: document.attributes.date
            author: document.attributes.author
            author_url: "/authors#" + document.attributes.author.replace(/[^a-zA-Z]/g,'')
            url: document.attributes.url
        }

        if tags[tag].documents.length > maxWeight
            maxWeight = tags[tag].documents.length

for k,tag of tags
    tag.weight = 100 + ((tag.documents.length / maxWeight) * 200)

text JSON.stringify tags
