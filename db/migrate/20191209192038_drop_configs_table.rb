class DropConfigsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :configs
  end
end
