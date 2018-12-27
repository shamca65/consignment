class RemoveProvinceFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :province, :text
    remove_column :customers, :street_address, :text
    remove_column :customers, :street_address2, :text
    remove_column :customers, :city, :text
    remove_column :customers, :postal, :text
  end
end
