class SetColumnDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column_default :pickup_dates, :created_at, default: -> { 'CURRENT_TIMESTAMP' }
  end
end