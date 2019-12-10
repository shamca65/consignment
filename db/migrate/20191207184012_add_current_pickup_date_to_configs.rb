class AddCurrentPickupDateToConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column :configs, :current_pickup_date, :date
  end
end
