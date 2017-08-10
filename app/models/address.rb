class Address < ActiveRecord::Base
  validates :street_address, :city, :state, :zip, presence: true

  before_save :australia_wide_delivery

  private

  def australia_wide_delivery
    self.country = "Australia"
  end
end
