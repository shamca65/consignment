class ChangePrecisionOfPriceColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price, :decimal, :precision => 8, :scale => 2
  end
end
