class AddPhoneAndEmailToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :phone, :string
    add_column :customers, :email, :string
  end
end
