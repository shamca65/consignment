class Item < ApplicationRecord
  include EventLogger

  belongs_to :customer, optional: true

  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event


  def log_create_event
    log_event("Item",self.id,"created")
  end

  def log_update_event
    log_event("Item",self.id,"udpated")
  end

  def log_destroy_event
    log_event("Item",self.id,"deleted")
  end
end
