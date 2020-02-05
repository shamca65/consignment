class DropColumnsFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_id
    remove_column :items, :item_id_id
    remove_column :items, :sale_item_id_id
  end
end
