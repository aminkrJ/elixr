class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, confirmation: { case_sensitive: false }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  after_create :launch_campaign

  has_many :campaign_subscribers
  has_many :campaigns, through: :campaign_subscribers

  private

  def launch_campaign
    self.campaign.launch if self.campaign
  end
end
