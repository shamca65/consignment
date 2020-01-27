class ChangePrecisionOfSaleSummaryPrice < ActiveRecord::Migration[5.2]
  def change
    change_column :sale_summaries, :sale_total, :decimal, :precision => 8, :scale => 2
  end
end
