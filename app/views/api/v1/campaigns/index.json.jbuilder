json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :short_description, :active, :campaign_subscribers_count
  json.campaign_subscribers_count campaign.campaign_subscribers_count + 100
  json.photo do
    json.thumb campaign.photo.url(:thumb)
    json.medium campaign.photo.url(:medium)
    json.original campaign.photo.url
  end
end
