class AddIndextoSalesSummaries < ActiveRecord::Migration[5.2]
  def change
    add_index :sale_summaries, :order_no
    add_column :items,:id_str, :string, index: true
  end
end
