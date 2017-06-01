class RemoveTypeFromVehicles < ActiveRecord::Migration[5.1]
  def change
    remove_column :vehicles, :type
    add_reference :vehicles, :vehicle_type
  end
end
