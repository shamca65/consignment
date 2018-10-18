class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone

  def full_name
    myName = last_name.titleize + ", " + first_name.titleize
    myName ||= 'not provided'
  end
end
