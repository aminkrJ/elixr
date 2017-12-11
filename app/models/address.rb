class Address < ActiveRecord::Base
  ACCEPTED_POSTCODES = ["2072", "2042", "2000", "2015"]

  belongs_to :address

  validates :street_address, :suburb, :city, :state, :zip, presence: true
  validates :zip, inclusion: { in: ACCEPTED_POSTCODES,
                                message: "We only deliver to #{ACCEPTED_POSTCODES.map(&:inspect).join(', ')} postcodes" }

  before_save :australia_wide_delivery


  private

  def australia_wide_delivery
    self.country = "Australia"
  end
end
