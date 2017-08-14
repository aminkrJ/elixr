class Customer < ActiveRecord::Base
  has_many :carts
  has_many :addresses

  accepts_nested_attributes_for :addresses

  validates :email, presence: true
end
