class AddGenderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :gender, :string, :limit => 10
  end
end
