class AddColumnsToConfig < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :key, :string
    add_column :configs, :value, :string
  end
end