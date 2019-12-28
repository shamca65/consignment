class AddSaleDateToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sale_date, :datetime
  end
end
