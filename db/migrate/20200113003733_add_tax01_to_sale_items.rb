class AddTax01ToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :tax01, :decimal, :precision => 8, :scale => 2
    add_column :sale_items, :tax02, :decimal, :precision => 8, :scale => 2
  end
end
