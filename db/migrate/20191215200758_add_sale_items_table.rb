class AddSaleItemsTable < ActiveRecord::Migration[5.2]
  def up
    create_table :sale_items do |t|
      t.timestamps null: false
      t.integer :sale_number, null: false
      t.datetime :sale_date
      t.decimal  :sale_price, :decimal, :precision => 8, :scale => 2
    end
  end


end