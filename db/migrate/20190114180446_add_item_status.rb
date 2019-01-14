class AddItemStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_status, :string, :limit => 10
  end
end
