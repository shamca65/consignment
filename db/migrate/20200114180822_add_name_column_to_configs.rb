class AddNameColumnToConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :name, :string
  end
end
