module Api
  class OrdersController < ActionController::Base
    skip_before_action :verify_authenticity_token
    include ApiHelper

    # GET /api/orders

    def index
      user_type = params[:type]
      id = params[:id]

      orders = Order.all
      render json: orders, status: :ok

      # Parameters validation
      unless user_type.present? && id.present?
        return render_400_error("Both 'user type' and 'id' params")
      end

      unless user_type.in?(%w[customer restaurant courier])
        return render_422_error("Invalid user type")
      end

      # Success responses
      # ...
      orders = Order.user_orders(user_type, id)
      render json: orders.map(&method(:format_order_long)), status: :ok
    end

    # POST /api/orders/:id/status/:status
    def update_order_status
        @order = Order.find(params[:id])
        new_status = params[:status]
    
        if @order.update(order_status: new_status)
          render json: { message: "Order status updated to '#{new_status}'" }, status: :ok
        else
          render json: { error: "Failed to update order status" }, status: :unprocessable_entity
        end
    end

    def create
      restaurant_id, customer_id, products = params.value_at(:restaurant_id, :customer_id, :products)

      # Validate required parameters
      unless restaurant_id.present? && customer_id.present? && products.present?
        return render_400_error("Restaurant ID, customer ID, and products are required")
      end

      # ...
    end
  end
end