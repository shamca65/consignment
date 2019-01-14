class AddItemTypeItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_type, :string, :limit => 10
  end
end
