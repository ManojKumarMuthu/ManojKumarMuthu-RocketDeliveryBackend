class Address < ApplicationRecord
    has_one :employee
    has_one :customer
    has_one :restaurant
  end
  