module EventLogger

  def log_event(rec_type, rec_id, rec_action)
    EventLog.create(record_type: rec_type, record_id: rec_id, record_action: rec_action)
  end

end