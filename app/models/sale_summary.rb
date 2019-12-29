class SaleSummary < ApplicationRecord
  include EventLogger
  has_many :sale_items

end
