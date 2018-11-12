class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #

  include EventLogger
  devise :database_authenticatable, :rememberable, :timeoutable, :trackable

  validates_presence_of :first_name, :last_name, :phone, :email

  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event


  def log_create_event
    log_event("User",self.id,"created")
  end

  def log_update_event
    log_event("User",self.id,"udpated")
  end

  def log_destroy_event
    log_event("User",self.id,"deleted")
  end

end
