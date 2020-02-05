class Item < ApplicationRecord
  include EventLogger
  self.to_json(:root => false)

  belongs_to :customer, optional: false
  has_many :photos
  has_one :sale_item

  validates :price, :presence => true, numericality: { :greater_than_or_equal_to => 0 }
  validates :description, :customer_id, :item_type, :gender, :size, :presence => true

  before_create :set_attr_for_create
  before_update :set_attr_for_update
  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  scope :customer_items, -> (id ){where("customer_id = ?", id)}
  scope :donation_items, -> {where("pickup_date <= ? and owner = 'customer'", $current_pickup_date)}
# TODO - consider archiving of sold/donated items
  scope :items_for_sale, -> {where("item_status = 'fs'")}

# TODO - move these to a table
  ITEM_SIZES = {
  :na => 'Not Applicable',
  :xs => 'Extra Small',
  :sm => 'Small',
  :md => 'Medium',
  :lg => 'Large',
  :xl => 'Extra Large',
  :xx => '2X Large'}

  ITEM_GENDERS = {
  :man => 'Men\'s',
  :woman => 'Woman\'s',
  :boy => 'Boy\'s',
  :girl => 'Girl\'s',
  :na => 'Not Applicable'
  }

# TODO - move these to a table
  ITEM_TYPES = {
      :sht => 'Shirt',
      :pnt => 'Pants',
      :sho => 'Shoes',
      :hat => 'Hat/Cap',
      :jckt => 'Jacket',
      :skrt => 'Skirt',
      :tsht => 'T-Shirt',
      :blse => 'Blouse',
      :acc => 'Accessory',
      :glv => 'Gloves'
      }

  ITEM_STATUSES = {
      :fs => 'For Sale',
      :sold => 'Sold',
      :po => 'Paid Out',
      :mtd => 'Moved To Donations',
      :rtc => 'Returned to Customer'
    }

  ransacker :id do
    Arel.sql("items.id_str")
  end

  def get_batch
    # get the current hour and return it
    t = Time.now
    x = '%02d' % t.hour
    return x.to_i
  end

  def set_attr_for_create
    self.clerk = "admin"
    self.item_status = 'fs' # for sale
    self.takein_date ||= Date.today
    self.customer ||= 'customer'
    self.takein_batch_number = get_batch
    self.id_str = self.id.to_s
  end

  def set_attr_for_update
    # the customer has tagged the agreement status one way or the other
  end

  # Logging
  #-----------------------------------------------------------------
  # Item
  #
  # Create
  # - log insert
  #
  # Update
  # - log update (field level?)
  #
  # Delete
  # - mark record as inactive
  #-----------------------------------------------------------------

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
