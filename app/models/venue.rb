class Venue < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "240x150>", thumb: "160x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  belongs_to :user

  validates :title, :suburb, presence: true
end
