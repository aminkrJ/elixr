json.array! @dropoff_locations do |location|
 json.id location.id
 json.title location.title
 json.address location.address
 json.suburb location.suburb
 json.capacity_per_day location.capacity_per_day
 json.phone location.phone
 json.description location.description
end
