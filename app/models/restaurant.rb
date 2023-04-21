class Restaurant < ApplicationRecord
    validates_uniqueness_of :address_id
    validates :user_id, :address_id, :phone, :name, :price_range, :active, presence: true
    validates :price_range, :inclusion => { :in => 1..3 }
    belongs_to :user, class_name: 'User', foreign_key: 'user_id'
    belongs_to :address, class_name: 'Address', foreign_key: 'address_id'
    has_many :products
    has_many :orders
    # Returns filtered list of restaurants based on rating and price_range params
    # The rating of a restaurant is the average of it's orders rating
    scope :rating_and_price, ->(rating, price_range) {
        restaurants = Restaurant.joins(:orders)
                                .select(:id, :name, :price_range)
                                .select('CAST(AVG(orders.restaurant_rating) + 0.5 AS INTEGER) as    rating')
        restaurants = restaurants.where(price_range: price_range) unless !price_range.present?
        restaurants = restaurants.group('restaurants.id').having('rating = ?', rating) unless   !rating.present?
        restaurants = restaurants.group('restaurants.id')
    }
end