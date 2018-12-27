class AddProvinceToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :province, :string
    add_column :customers, :street_address, :string
    add_column :customers, :street_address2, :string
    add_column :customers, :city, :string
    add_column :customers, :postal, :string
  end
end
