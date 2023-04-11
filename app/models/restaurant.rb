  class Restaurant < ApplicationRecord
    belongs_to :user
    belongs_to :address
    has_many :products, dependent: :destroy
    has_many :orders, dependent: :destroy
  end