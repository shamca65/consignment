class DropSaleItemsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :sale_items
  end
end
