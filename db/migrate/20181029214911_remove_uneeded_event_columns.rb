class RemoveUneededEventColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_logs, :event_id
    remove_column :event_logs, :event_description
  end
end
