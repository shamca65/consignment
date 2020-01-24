class SaleItem < ApplicationRecord
  include EventLogger
  has_many :item

  before_create :set_attr_for_create
  before_update :set_attr_for_update

  def set_attr_for_create
    self.tax_rate_a = $tax_rate_a
    self.tax_rate_b = $tax_rate_b
    self.item_total = self.item_price + calculate_tax_total
  end

  def set_attr_for_update
    self.tax_rate_a = $tax_rate_a
    self.tax_rate_b = $tax_rate_b
    self.item_total = self.item_price + calculate_tax_total
  end

  def calculate_tax_total
    tmp_portion_a = 0
    tmp_portion_b = 0
    #
    if (self.tax_rate_a > 0)
      tmp_portion_a = self.item_price * self.tax_rate_a
    end
    #
    if (self.tax_rate_b > 0)
      tmp_portion_b = self.item_price * self.tax_rate_b
    end
    return (tmp_portion_a + tmp_portion_b)
  end

  def log_create_event
    log_event("Sale Item",self.id,"created")
  end

  def log_update_event
    log_event("Sale Item",self.id,"udpated")
  end

  def log_destroy_event
    log_event("Sale Item",self.id,"deleted")
  end

end
