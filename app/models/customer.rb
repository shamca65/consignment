class Customer < ApplicationRecord

  has_many :items, dependent: :destroy

  include EventLogger
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  validates_presence_of :first_name, :last_name, :phone

  # ElasticSearch Index
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :first_name, analyzer: 'english'
      indexes :last_name, analyzer: 'english'
      indexes :email, analyzer: 'english'
    end
  end

  def full_name
    myName = last_name.titleize + ", " + first_name.titleize
    myName ||= 'not provided'
  end

  def log_create_event
    log_event("Customer",self.id,"created")
  end

  def log_update_event
    log_event("Customer",self.id,"udpated")
  end

  def log_destroy_event
    log_event("Customer",self.id,"deleted")
  end

end
