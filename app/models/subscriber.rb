class Subscriber < ActiveRecord::Base
  validates :email, presence: true
  validates :email, confirmation: { case_sensitive: false }
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_uniqueness_of :email, message: "already exists."

  has_many :campaign_subscribers
  has_many :campaigns, through: :campaign_subscribers
end
