json.array! @articles do |article|
 json.id article.id
 json.title article.title
 json.description article.description
 json.slug article.slug
 json.category article.category
 json.author article.author
 json.photo do
   json.thumb article.photo.url(:thumb)
   json.medium article.photo.url(:medium)
   json.original article.photo.url
 end
 json.created_at article.created_at
end
