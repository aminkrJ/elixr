class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.attachment :pdf
      t.string :pdf_title

      t.timestamps null: false
    end
  end
end
