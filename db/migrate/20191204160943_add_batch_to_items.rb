class AddBatchToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :takein_batch_number, :integer
    add_index :items, :takein_batch_number
  end
end
