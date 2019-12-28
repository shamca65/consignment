class CreateSaleSummaries < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_summaries do |t|
      t.decimal :sale_total
      t.bigint :order_no
      t.datetime :sale_date

      t.timestamps
    end
  end
end
