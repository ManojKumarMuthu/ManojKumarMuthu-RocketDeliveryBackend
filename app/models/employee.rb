class Employee < ApplicationRecord
    validates_uniqueness_of :user_id
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    validates :user, presence: { message: "can't be blank" }
    validates :user, presence: true
    validates :address, presence: true
    validates :phone, presence: true
  end

