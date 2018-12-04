class RemoveOldSizeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :size
  end
end
