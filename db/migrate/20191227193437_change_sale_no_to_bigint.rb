class ChangeSaleNoToBigint < ActiveRecord::Migration[5.2]
  def change
    change_column :sale_items, :order_no, :bigint
  end
end
