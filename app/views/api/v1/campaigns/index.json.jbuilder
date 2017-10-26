json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :short_description, :active, :campaign_subscribers_count
end
