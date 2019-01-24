class AddItemOwner < ActiveRecord::Migration[5.2]
  def change
		add_column :items, :owner, :string, :limit=>15
  end
end
