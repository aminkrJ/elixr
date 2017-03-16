class Customer < ActiveRecord::Base
  has_many :carts

  validates :email, :address, :city, :country, :postcode, :state, presence: true
end
