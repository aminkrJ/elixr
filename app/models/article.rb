class Article < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "240x150>", thumb: "160x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  scope :published, -> { where(published: true) }
end
