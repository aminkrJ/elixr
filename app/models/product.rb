class Product < ActiveRecord::Base
  scope :primary, -> {where(primary: true)}
end
