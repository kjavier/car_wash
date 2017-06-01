class AddTimestampToTransactions < ActiveRecord::Migration[5.1]
  def change
    change_table(:vehicle_types) { |t| t.timestamps }
    change_table(:vehicles) { |t| t.timestamps }
    change_table(:sales) { |t| t.timestamps }
  end
end
