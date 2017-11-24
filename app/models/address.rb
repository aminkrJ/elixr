class Address < ActiveRecord::Base
  belongs_to :address

  validates :street_address, :suburb, :city, :state, :zip, presence: true

  before_save :australia_wide_delivery

  private

  def australia_wide_delivery
    self.country = "Australia"
  end
end
