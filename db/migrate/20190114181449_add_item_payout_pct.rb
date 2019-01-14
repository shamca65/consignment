class AddItemPayoutPct < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :payout_pct, :decimal, :precision => 8, :scale => 2
  end
end
