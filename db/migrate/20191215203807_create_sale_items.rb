class CreateSaleItems < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_items do |t|
      t.decimal :price

      t.timestamps
    end
  end
end
