class Address < ApplicationRecord
    validates :street_address, :city, :postal_code, presence: true
    has_one :employee
    has_one :user
    has_one :restaurant
    has_many :couriers
    has_many :customers
    has_many :employees
  end