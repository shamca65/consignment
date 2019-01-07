class Customer < ApplicationRecord

  has_many :items, dependent: :destroy

  validates :first_name, :last_name, :phone, :presence => true
  validates :email, :email_format => {:message => 'Email format is incorrect - record was not saved.'}

  include EventLogger

  accepts_nested_attributes_for :items

  before_create :set_attr_for_create
  before_update :set_attr_for_update

  after_destroy :log_destroy_event

  AGREEMENT_STATUSES = {:Unsigned => 0, :Signed => 1, :UnderReview => 2}
  TRANS_TYPE = {:AccountSetup => 0, :AgreementUpdate => 1, :AccountDeactivated => 2}
  PROVINCES = { :ON => 'Ontario',
      :AB => 'Alberta',
      :BC => 'British Columbia',
      :MB => 'Manitoba',
      :NL => 'Newfoundland and Labrador',
      :NB => 'New Brunswick',
      :NS => 'Nova Scotia',
      :SK => 'Saskatchewan',
      :NT => 'Northwest_Territories',
      :NU => 'Nunavut',
      :YK => 'Yukon',
      :PE => 'Prince Edward Island',
      :QC => 'Quebec' }

  #-----------------------------------------------------------------
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
  #-----------------------------------------------------------------

  def set_attr_for_create
    self.agreement_status ||= 0 #unsigned
    self.trans_type = TRANS_TYPE[:AccountSetup]
    self.acct_open_date = Date.today
    self.last_trans_date = Date.today
    self.province = 'DU'
    log_event("Customer", self.id, "Account Created")
  end

  def set_attr_for_update
    # the customer has togged the agreement status one way or the other
    if self.agreement_status_changed?
      self.trans_type = TRANS_TYPE[:AgreementUpdate]
      self.last_trans_date = Date.today
      log_event("Customer", self.id, "Agreement Updated")
    end
  end

  def full_name
    myName = last_name.titleize + ", " + first_name.titleize
    myName ||= 'not provided'
  end

end
