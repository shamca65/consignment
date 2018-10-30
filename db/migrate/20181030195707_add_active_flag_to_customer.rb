class AddActiveFlagToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :active, :boolean
  end
end
