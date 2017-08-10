class Customer < ActiveRecord::Base
  has_many :carts
  has_many :addresses

  validates :email, presence: true
end
