class AddStreet2 < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :street_address2, :text
  end
end
