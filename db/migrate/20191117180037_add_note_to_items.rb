class AddNoteToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_note, :text
  end
end