class AddVenueToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :venue, index: true
  end
end
