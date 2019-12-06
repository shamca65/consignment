class UpdatePuDateColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :pickup_dates, :current_pu_date, :current
  end
end