class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.decimal :price, precision: 10, scale: 2
      t.integer :item_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
