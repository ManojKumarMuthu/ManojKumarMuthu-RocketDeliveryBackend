class Restaurant < ApplicationRecord
    validates_uniqueness_of :address_id
    validates :user_id, :address_id, :phone, :name, :price_range, :active, presence: true
    validates :price_range, :inclusion => { :in => 1..3 }
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    has_many :products
    has_many :orders
end