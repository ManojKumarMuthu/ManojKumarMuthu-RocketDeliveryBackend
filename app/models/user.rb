# class User < ApplicationRecord
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

#   has_secure_password
#   validates :email, uniqueness: true, presence: true
#   validates :name, presence: true
#   has_one :employee
#   has_one :customer
#   has_one :restaurant
#   has_one :courier
# end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  has_one :employee
  has_one :customer
  has_many :restaurants
  has_one :courier
end


