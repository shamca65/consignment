class AddAssociationToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_items, :items, index: true
  end
end
