class AddSaleItemsReference < ActiveRecord::Migration[5.2]
  def change
    add_reference :sale_items, :sale_summaries, foreign_key:true
  end
end
