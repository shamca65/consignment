class AddExtendedTaxColsToSaleSummaries < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_summaries, :tax_a_total, :decimal, :precision => 8, :scale => 2
    add_column :sale_summaries, :tax_b_total, :decimal, :precision => 8, :scale => 2
  end
end
