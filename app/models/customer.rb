class Customer < ActiveRecord::Base
  has_many :carts

  validates :email, presence: true
end
