class ChangeDateColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :pickup_date, :date
  end
end
