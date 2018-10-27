class AddFkToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :customers, index: true, foreign_key: true
  end
end
