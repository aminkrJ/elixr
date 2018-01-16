json.array! @venues do |venue|
 json.id venue.id
 json.title venue.title
 json.address venue.address
 json.suburb venue.suburb
 json.capacity_per_day venue.capacity_per_day
 json.phone venue.phone
 json.description venue.description
end
