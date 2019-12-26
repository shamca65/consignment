class AddOrderNoToSaleItems < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_items, :order_no, :integer, {index: true, foreign_key: false}
  end
end
