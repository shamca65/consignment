class AddItemTotalToSaleSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_summaries, :items_total, :decimal, :precision => 8, :scale => 2
  end
end
