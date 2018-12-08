class AddCustomerColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :street_address, :text
    add_column :customers, :city, :text
    add_column :customers, :province, :text
    add_column :customers, :postal, :text
    add_column :customers, :acct_open_date, :datetime
    add_column :customers, :last_trans_date, :datetime
    add_column :customers, :trans_type, :integer
    add_column :customers, :agreement_status, :integer
  end
end
