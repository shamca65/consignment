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
      indexes :first_name, type: :text, analyzer: 'english'
      indexes :last_name, type: :text, analyzer: 'english'
      indexes :email, type: :text, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['first_name', 'last_name', 'email', 'id']
                }
            }
        }
    )
  end

  # TODO Need to refactor this and possibly get rid of 'active' parameter
  def self.search_published(query)
    self.search({
                    query: {
                        bool: {
                            must: [
                                {
                                    multi_match: {
                                        query: query,
                                        fields: [:first_name, :last_name, :email]
                                    }
                                },
                                {
                                    match: {
                                        active: true
                                    }
                                }]
                        }
                    }
                })
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
