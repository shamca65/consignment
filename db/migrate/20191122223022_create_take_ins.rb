class CreateTakeIns < ActiveRecord::Migration[5.2]
  def change
    create_table :take_ins do |t|
      t.integer :customer_id
      t.integer :item_id      
      t.timestamps
    end
  end
end
