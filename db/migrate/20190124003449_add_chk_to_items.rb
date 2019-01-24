class AddChkToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :chk, :string, :limit => 5
  end
end
