class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #
  devise :database_authenticatable, :rememberable

  validates_presence_of :first_name, :last_name, :phone

end
