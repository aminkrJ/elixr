class CreateCartTransitions < ActiveRecord::Migration
  def change
    create_table :cart_transitions do |t|
      t.string :to_state, null: false
      t.json :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :cart_id, null: false
      t.boolean :most_recent, null: false
      t.timestamps null: false
    end

    add_foreign_key :cart_transitions, :carts

    add_index(:cart_transitions,
              [:cart_id, :sort_key],
              unique: true,
              name: "index_cart_transitions_parent_sort")
    add_index(:cart_transitions,
              [:cart_id, :most_recent],
              unique: true,
              where: 'most_recent',
              name: "index_cart_transitions_parent_most_recent")
  end
end
