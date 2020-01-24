class AddItemTotalToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :item_total, :decimal, :precision => 8, :scale => 2
  end
end
