class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :vehicles, foreign_key: true
      t.float :amount, default: 0
    end
  end
end
