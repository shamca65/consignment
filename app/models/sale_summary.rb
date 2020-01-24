class SaleSummary < ApplicationRecord
  include EventLogger
  has_many :sale_item

  before_create :set_attr_for_create
  before_update :set_attr_for_update

  def set_attr_for_create
    # a new rec is created in the controller
    # now summarize sale_items recs in to a sale_summary rec
    this_sale_total = SaleItem.where({ order_no: self.order_no}).sum(:item_total)
    puts "This sale total: " + this_sale_total.to_s
  end

  def set_attr_for_update
    self.tax_rate_a = $tax_rate_a
  end
end
