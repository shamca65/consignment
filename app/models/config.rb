class Config < ApplicationRecord
    include EventLogger

    validates :current_pickup_date, :slug, :presence => true

    def log_create_event
        log_event("Config",self.id,"created")
    end
    
    def log_update_event
        log_event("Config",self.id,"udpated")
    end

end
