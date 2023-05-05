class Api::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    transaction_succeeded = false
    user = User.where(email: request.params["email"] || request.params["user"]["email"]).first
    if user != nil
      if user.valid_password?(request.params["password"] || request.params["user"]["password"])
        sign_in(:user, user)
        transaction_succeeded = true
      end
    end
    if transaction_succeeded
      customer = Customer.where(user_id: user.id).first
      courier = Courier.where(user_id: user.id).first
      flash[:notice] = "You are signed in!"
      render json: {success: true, user_id: user.id, customer_id: customer && customer.id, courier_id: courier && courier.id}, status: 200
    else
      flash[:notice] = "Invalid email or password!"
      render json: {success: false}, status: 401
    end
  end
  def new
    render
  end
  # def create
  #   super
  # end
  # def destroy
  #   super
  # end
  # protected
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end







