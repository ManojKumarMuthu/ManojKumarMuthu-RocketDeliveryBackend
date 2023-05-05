module Api
  # class OrdersController < ActionController::Base
  #     def index
  #         id = params[:id]
  #         @order = Order.find_by(id: id)
  #         @order_status = OrderStatus.find_by(name: params[:status])
  #         isValid = false
  #         if params[:status] != 'invalid' && @order != nil && @order_status != nil
  #             @order.order_status_id = @order_status.id
  #             @order.save
  #             isValid = true
  #         end
  #         if isValid
  #             render json: nil, status: :ok
  #         else
  #             render json: nil, status: :unprocessable_entity
  #         end
  #     end
  #     def all
  #     end
  # end
  class OrdersController < ApplicationController
      skip_before_action :verify_authenticity_token
          def index
            user_type = params[:type]
            id = params[:id]
            unless user_type.present? && id.present?
              return render_400_error("Both 'user type' and 'id' parameters are required")
            end
            unless user_type.in?(%w[customer restaurant courier])
              return render_422_error("Invalid user type")
            end
            # customer = Order.find_by(customer_id)
            # customer = Order.find_by(user_type)
          
              if ['customer'].include?(params[:type])
                puts "+=====+"
                orders = Order.user_orders(user_type, id)
                render json: orders.map(&method(:format_order_long)), status: :ok
              end 
             
          end
          def create
            restaurant_id, customer_id, products = params.values_at(:restaurant_id, :customer_id, :products)
            unless restaurant_id.present? && customer_id.present? && products.present?
              return render_400_error("Restaurant ID, customer ID, and products are required")
                end
                restaurant = Restaurant.find_by(id: restaurant_id)
                customer = Customer.find_by(id: customer_id)
                unless restaurant && customer
              return render_422_error("Invalid restaurant or customer ID")
            end
            order = Order.create!(restaurant_id: restaurant_id, customer_id: customer_id, order_status_id: OrderStatus.find_by(name: "pending")&.id)
            unless order
             return render_422_error("Failed to create order")
            end
            products.each do |product_params|
              product = Product.find_by(id: product_params[:id])
              unless product
                order.destroy
                return render_422_error("Invalid product ID")
              end
              order.product_orders.create!(product_id: product.id, product_quantity: product_params[:quantity].to_i, product_unit_cost: product.cost)
            end
            render json: format_order_long(order), status: :created
                # send SMS
                if (request.params['confirmation_method'].include?'sms')
                message = "Thank You, #{new_order[:customer_name]}! we have received your order(ID: ##{new_order[:id]})."
                TwilioTextMessenger.new(message).call
            end
          end
          def set_rating
            rating = params[:restaurant_rating]
            id = params[:id]
            order = Order.find_by(id: id)
            return render_422_error("Invalid order") unless order
            return render_400_error("Restaurant rating required") unless rating.present?
            return render_422_error("Invalid rating") unless rating.between?(1,5)
            order.update(restaurant_rating: rating)
            render json: { restaurant_rating: rating }, status: :ok
          end
          private
          def format_order_long(order)
            {
              id: order.id,
              customer_id: order.customer.id,
              customer_name: order.customer.user.name,
              customer_address: order.customer.address,
              restaurant_id: order.restaurant.id,
              restaurant_name: order.restaurant.name,
              restaurant_address: order.restaurant.address,
              courier_id: order.courier&.id,
              courier_name: order.courier&.user&.name,
              status: order.order_status.name,
              products: order.product_orders.map do |po|
                {
                  product_id: po.product.id,
                  product_name: po.product.name,
                  quantity: po.product_quantity,
                  unit_cost: po.product_unit_cost,
                  total_cost: po.product_quantity * po.product_unit_cost
                }
              end,
              total_cost: order.total_cost
            }
          end
        def render_422_error(message)
          render json: { error: message }, status: :unprocessable_entity
        end
        def render_400_error(message)
          render json: { error: message }, status: :bad_request
        end
      end
end