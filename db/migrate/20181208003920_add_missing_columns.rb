class AddMissingColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :clerk, :text
    add_column :items, :status, :integer
    add_column :items, :sold_date, :datetime
    add_column :items, :takein_date, :datetime
    add_column :items, :pickup_date, :datetime
    add_column :items, :payout_date, :datetime
    add_column :items, :payout_amount, :decimal
    add_column :items, :owing_client, :decimal
    add_column :items, :paid_client, :decimal
  end
end
