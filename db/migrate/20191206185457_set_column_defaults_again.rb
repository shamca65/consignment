class SetColumnDefaultsAgain < ActiveRecord::Migration[5.2]
  def change
    change_column_default :pickup_dates, :created_at, :datetime, :default => DateTime.now
  end
end