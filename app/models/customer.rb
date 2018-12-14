class Customer < ApplicationRecord

  has_many :items, dependent: :destroy

  include EventLogger
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  accepts_nested_attributes_for :items

  enum trans_type: [AccountSetup:0,  AgreementUpdate:1, AccountInactive:2]
  enum agreement_status: [Signed:0, UnSigned:1]

  before_create :set_create_defaults
  before_update :set_update_defaults
  after_create :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  validates_presence_of :first_name, :last_name, :phone, :agreement_status

  # Customer
  #
  # Create
  # - log insert
  # - stamp acct_open_date as Date.today
  # - stamp trans_type as 'acct create'
  # - stamp last_trans_date as Date.today
  #
  # Update
  # - log update (field level?)
  # - if agreement_status WAS unsigned, but is now signed
  #     - stamp last_trans_date as today
  #     - stamp trans_type as 'AccountInactive'
  #
  # Delete
  # - mark record as inactive
  # - stamp last_trans_date as today
  #    - stamp trans_type as 'AgreementSigned'
  #
  #
  #-----------------------------------------------------------------
  #

  #-----------------------------------------------------------------
  #
  # ElasticSearch Index
  settings index: {number_of_shards: 1} do
    mappings dynamic: 'false' do
      indexes :first_name, type: :text, analyzer: 'english'
      indexes :last_name, type: :text, analyzer: 'english'
      indexes :email, type: :text, analyzer: 'english'
    end
  end

  def self.search(query) __elasticsearch__.search({
      query: {
       multi_match: {
        query: query,
         fields: ['first_name', 'last_name', 'email', 'id']
       }
      }
     })
  end

  # TODO Need to refactor this and possibly get rid of 'active' parameter
  def self.search_published(query) self.search({
       query: {
          bool: {
           must: [
             { multi_match:
                { query: query, fields: [:first_name, :last_name, :email] }
             },
             { match: { active: true } }
           ]
          }
        }
      })
  end

  def set_create_defaults
    self.acct_open_date = Date.today
    self.trans_type = Customer.trans_type[:AgreementUpdate].value
    self.last_trans_date = Date.today
  end

  def set_update_defaults
    # the customer has togged the agreement status one way or the other
     if self.agreement_status_changed?
       self.trans_type = Customer.trans_type[:AgreementUpdate].value
       self.last_trans_date = Date.today
       log_event("Customer", self.id, "Agreement changed to " + self.agreement_status)
    end
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
