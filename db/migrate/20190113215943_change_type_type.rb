class ChangeTypeType < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :type, :string, :limit => 10
  end
end
