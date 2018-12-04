class RenameSizeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :size_enum, :size
  end
end
