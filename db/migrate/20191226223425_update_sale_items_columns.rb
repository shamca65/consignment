class UpdateSaleItemsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :sale_date, :datetime, {index: true, foreign_key: false}
    add_column :sale_items, :clerk, :string, :limit => 15
    rename_column :sale_items, :price, :item_price
  end
end
