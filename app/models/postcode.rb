class Postcode < ActiveRecord::Base

  def self.pickup(postcode)
    postcode = where(postcode: postcode, delivery_option: "pickup").first_or_create(count: 0)
    postcode.increment! :count
    postcode
  end

  def self.delivery(postcode)
    postcode = where(postcode: postcode, delivery_option: "delivery").first_or_create(count: 0)
    postcode.increment! :count
    postcode
  end
end
