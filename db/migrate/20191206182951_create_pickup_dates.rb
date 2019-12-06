class CreatePickupDates < ActiveRecord::Migration[5.2]
  def change
    create_table :pickup_dates do |t|
      t.datetime :current_pu_date

      t.timestamps
    end
  end
end
