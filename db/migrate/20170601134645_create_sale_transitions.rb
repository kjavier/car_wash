class CreateSaleTransitions < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata
      t.integer :sort_key, null: false
      t.integer :sale_id, null: false
      t.boolean :most_recent
      t.timestamps null: false
    end

    add_index(:sale_transitions,
              [:sale_id, :sort_key],
              unique: true,
              name: "index_sale_transitions_parent_sort")
    add_index(:sale_transitions,
              [:sale_id, :most_recent],
              unique: true,
              
              name: "index_sale_transitions_parent_most_recent")
  end
end
