class AddColumsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :notes, :text
    add_column :items, :type, :integer
    add_column :items, :size_enum, :integer
    add_column :items, :photo_id, :integer, index: true, foreign_key: true
  end
end
