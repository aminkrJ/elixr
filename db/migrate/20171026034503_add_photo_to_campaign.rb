class AddPhotoToCampaign < ActiveRecord::Migration
  def up
    add_attachment :campaigns, :photo
  end

  def down
    remove_attachment :campaigns, :photo
  end
end
