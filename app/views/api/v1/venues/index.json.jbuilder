json.array! @venues do |venue|
 json.id venue.id
 json.title venue.title
 json.address venue.address
 json.suburb venue.suburb
 json.capacity_per_day venue.capacity_per_day
 json.phone venue.phone
 json.description venue.description
 json.status venue.status
 json.short_description venue.short_description
  json.logo do
   json.thumb venue.logo.url(:thumb)
   json.medium venue.logo.url(:medium)
   json.original venue.logo.url
  end
end
