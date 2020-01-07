class AddTaxExemptToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :tax_exempt, :boolean
  end
end
