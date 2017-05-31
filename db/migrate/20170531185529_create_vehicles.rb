class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :type, null: false
      t.string :license_plate, null: false
    end
  end
end
