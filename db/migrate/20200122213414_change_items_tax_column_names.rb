class ChangeItemsTaxColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :sale_items, :tax01, :tax_rate_a
    rename_column :sale_items, :tax02, :tax_rate_b
  end
end