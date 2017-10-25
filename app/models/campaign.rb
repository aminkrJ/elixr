class Campaign < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :strategy

  has_attached_file :pdf
  do_not_validate_attachment_file_type :pdf

  has_many :subscribers, through: :campaign_subscribers
  has_many :campaign_subscribers

  def launch(subscriber)
    campaign_strategy(subscriber).launch
  end

  private

  def campaign_strategy(subscriber)
    Object.const_get("CampaignStrategy::" + strategy).new(self, subscriber)
  end
end
