class AddUserToVenues < ActiveRecord::Migration
  def change
    add_reference :venues, :user, index: true
    add_column :venues, :opening_hours, :string
    add_attachment :venues, :logo
  end
end
