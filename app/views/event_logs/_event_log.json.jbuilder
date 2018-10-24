json.extract! event_log, :id, :event_id, :integer,, :event_description, :string, :created_at, :updated_at
json.url event_log_url(event_log, format: :json)
