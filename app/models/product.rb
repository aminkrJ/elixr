class Product < ActiveRecord::Base
  has_attached_file :photo, styles: { medium: "240x150>", thumb: "160x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  scope :primary, -> {where(primary: true)}
end
