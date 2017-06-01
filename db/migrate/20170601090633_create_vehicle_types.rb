class CreateVehicleTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_types do |t|
      t.string :name, null: false
      t.float :price, null: false
    end
  end
end
