class Customer < ActiveRecord::Base
  has_many :carts

  validates :email, :address, :city, :country, :zip, :state, presence: true
end
