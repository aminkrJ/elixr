class Campaign < ActiveRecord::Base
  validates_presence_of :name

  has_attached_file :pdf
  do_not_validate_attachment_file_type :pdf

  has_many :subscribers, through: :campaign_subscribers
  has_many :campaign_subscribers

  def launch
  end
end
