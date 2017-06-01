class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :vehicles, foreign_key: true
      t.float :amount, default: 0
    end
  end
end
