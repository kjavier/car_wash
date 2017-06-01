class RenameVehiclesIdInSales < ActiveRecord::Migration[5.1]
  def change
    rename_column :sales, :vehicles_id, :vehicle_id
  end
end
