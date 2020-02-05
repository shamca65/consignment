class AddAssociationToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :sale_item_id, index: true
  end
end
