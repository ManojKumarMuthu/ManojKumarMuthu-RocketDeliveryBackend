class Product < ApplicationRecord
    belongs_to :restaurants, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    has_many :product_orders
    validates :name, :cost, :restaurant_id, presence: true
    validates :cost, numericality: { greater_than_or_equal_to: 0 }

end


