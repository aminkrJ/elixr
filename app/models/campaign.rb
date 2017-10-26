class Campaign < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "240x150>", thumb: "160x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

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
