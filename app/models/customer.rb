class Customer < ApplicationRecord

  has_many :items, dependent: :destroy

  include EventLogger
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  accepts_nested_attributes_for :items

  enum trans_type: [:AccountSetup, :AgreementSigned, :AccountRemoved]
  enum agreement_status: [:Signed, :UnSigned]

  after_create :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  validates_presence_of :first_name, :last_name, :phone

  # Customer
  #
  # Create
  # - log insert
  # - stamp acct_open_date as today
  # - stamp trans_type as 'acct create'
  # - stamp last_trans_date as today
  #
  # Update
  # - log update (field level?)
  # - stamp last_trans_date as today
  #
  # Delete
  # - mark record as inactive
  # - stamp trans_type as 'acct remove'
  # - stamp last_trans_date as today
  #
  #

  # ElasticSearch Index
  settings index: {number_of_shards: 1} do
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
    log_event("Customer", self.id, "created")
  end

  def log_update_event
    log_event("Customer", self.id, "udpated")
  end

  def log_destroy_event
    log_event("Customer", self.id, "deleted")
  end

end
