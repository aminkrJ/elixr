class RemoveSubscribedToFromSubscribers < ActiveRecord::Migration
  def change
    remove_column :subscribers, :subscribed_to
  end
end
