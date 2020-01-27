class SaleSummary < ApplicationRecord
  include EventLogger
  has_many :sale_items

  before_create :set_attr_for_create
  before_update :set_attr_for_update

  def set_attr_for_create
    # now summarize sale_items recs in to a sale_summary rec
  end

  def set_attr_for_update

  end
end
