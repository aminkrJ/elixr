class Cart < ActiveRecord::Base
  belongs_to :customer, validate: true

  accepts_nested_attributes_for :customer

  validates_presence_of :customer
end
