  class Customer < ApplicationRecord
    validates_uniqueness_of :user_id
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    has_many :orders
    validates :user, presence: { message: "can't be blank" }
    validates :address, presence: { message: "can't be blank" }
    validates :phone, presence: { message: "can't be blank" }
    validates :active, presence: true
  end