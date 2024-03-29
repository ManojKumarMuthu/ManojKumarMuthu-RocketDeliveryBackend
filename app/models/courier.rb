class Courier < ApplicationRecord

    # validates_uniqueness_of :user_id
    validates :user_id, :address_id, :courier_status_id, :phone, :active, presence: true
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :courier_status, class_name: 'CourierStatus', foreign_key: 'courier_status_id'
    has_many :orders
end


