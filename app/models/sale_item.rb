class SaleItem < ApplicationRecord
  include EventLogger
  has_many :items

  def log_create_event
    log_event("Sale Item",self.id,"created")
  end

  def log_update_event
    log_event("Sale Item",self.id,"udpated")
  end

  def log_destroy_event
    log_event("Sale Item",self.id,"deleted")
  end

end