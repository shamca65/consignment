module EventLogger

  def log_event(event_description: string)
    EventLog.create(event_description: event_description)
  end

end