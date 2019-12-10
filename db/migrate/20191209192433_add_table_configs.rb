class AddTableConfigs < ActiveRecord::Migration[5.2]
  def up
    create_table :configs do |t|
      t.timestamps null: false
      t.string  :slug, index: true, limit: 15
      t.datetime :current_pickup_date
    end
  end
end
