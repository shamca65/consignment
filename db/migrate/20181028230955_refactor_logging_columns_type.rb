class RefactorLoggingColumnsType < ActiveRecord::Migration[5.2]
  def change
    add_column :event_logs, :record_type, :string
    add_column :event_logs, :record_id, :integer
    add_column :event_logs, :record_action, :string
  end
end
