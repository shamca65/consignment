class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 10 }

  def full_name
    myName = last_name.upcase + ", " + first_name.upcase
    myName ||= 'not provided'
  end

end
