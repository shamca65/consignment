class ChangePrecisionOfSaleItemPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :sale_items, :item_price, :decimal, :precision => 8, :scale => 2
  end
end
