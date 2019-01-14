class Item < ApplicationRecord
  include EventLogger

  belongs_to :customer, optional: true
  has_many :photos

  after_create  :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  scope :customer_items, -> (id ){where("customer_id = ?", id)}

  ITEM_SIZES = {
  :na => 'Not Applicable',
  :xs => 'Extra Small',
  :sm => 'Small',
  :md => 'Medium',
  :lg => 'Large',
  :xl => 'Extra Large',
  :xx => '2X Large'}

  ITEM_GENDERS = {
  :man => 'Man\'\s',
  :woman => 'Woman\'\s',
  :boy => 'Boy\'\s',
  :girl => 'Girl\'\s'
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
      :glv => 'Gloves'}


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
