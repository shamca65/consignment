class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :customers_id, :customer_id
  end
end
