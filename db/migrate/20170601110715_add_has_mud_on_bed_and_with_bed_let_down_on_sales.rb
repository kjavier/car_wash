class AddHasMudOnBedAndWithBedLetDownOnSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :has_mud_on_bed, :boolean, default: false
    add_column :sales, :with_bed_let_down, :boolean, default: false
  end
end
