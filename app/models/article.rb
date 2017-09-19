class Article < ActiveRecord::Base
  has_attached_file :photo,
    styles: { medium: "255x107>", thumb: "150x100>" },
    default_url: "/images/:style/missing.png",
    url: "/system/:tenant_name/:class/:attachment/:id_partition/:style/:filename"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  scope :published, -> { where(published: true) }
end
