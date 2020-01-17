class Config < ApplicationRecord
    include EventLogger

    validates :slug, :presence => true

    def log_create_event
        log_event("Config",self.id,"created")
    end
    
    def log_update_event
        log_event("Config",self.id,"udpated")
    end

end
