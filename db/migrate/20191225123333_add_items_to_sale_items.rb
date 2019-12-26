class AddItemsToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_items, :item, index: true
  end
end
