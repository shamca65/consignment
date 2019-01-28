class Item < ApplicationRecord
  include EventLogger

  belongs_to :customer, optional: true
  has_many :photos

  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

# TODO - need dynamic pickup data
  scope :customer_items, -> (id ){where("customer_id = ?", id)}
  scope :pickup_items, -> {where("pickup_date <= ? and owner != 'store'", '2019-12-31')}

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
