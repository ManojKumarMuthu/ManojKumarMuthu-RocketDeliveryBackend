class Order < ApplicationRecord
    belongs_to :restaurant, class_name: 'Restaurant', foreign_key: 'restaurant_id'
    belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id'
    belongs_to :order_status, class_name: 'OrderStatus', foreign_key: 'order_status_id'
    belongs_to :courier, class_name: 'Courier', foreign_key: 'courier_id', optional: true
    has_many :product_orders
    has_many :products, through: :product_orders, class_name: 'Product'
  
    validates :restaurant_id, :customer_id, :order_status_id, presence: true
    # validates :courier, presence: true, if: -> { order_status_id == 1 }
    # validates :restaurant_rating, inclusion: { in: 1..5 }, allow_nil: true
    validates :restaurant_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true
    # Set default value for restaurant_rating
    # attribute :restaurant_rating, :integer, default: 3
  
    # Set default value for courier_id
    attribute :courier_id, :integer, default: -> { Courier.all.sample&.id }

    def self.user_orders(user_type, user_id)
      case user_type
      when "customer"
        includes(:restaurant, :courier, :product_orders).where(customer_id: user_id)
      # when "restaurant"
      #   includes(:customer, :courier, :product_orders).where(restaurant_id: user_id)
      # when "courier"
      #   includes(:customer, :restaurant, :product_orders).where(courier_id: user_id)
      else
        none
      end
    end
    def total_cost
      product_orders.sum('product_quantity * product_unit_cost')
    end
  end



  
    