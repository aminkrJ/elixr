class Customer < ActiveRecord::Base
  has_many :carts

  validates :email, :address, :city, :country, :postcode, :suburb, :state, presence: true
end
