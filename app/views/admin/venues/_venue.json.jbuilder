json.extract! venue, :id, :address, :suburb, :created_at, :updated_at
json.url venue_url(venue, format: :json)
