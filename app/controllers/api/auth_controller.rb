module Api
  class AuthController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def index
      data = JSON.parse(request.body.read)
      puts "data ====================="
      puts data

      email = data['email']
      puts "email ====================="
      puts email
      password = data['password']
      puts "password ====================="
      puts password
      user = User.find_by(email: email )
      puts "user ====================="
      # puts JSON.stringify(user) 
      puts user.to_json
      customer = Customer.find_by(user_id: user.id)
      puts "custmer ====================="
      # puts JSON.stringify(customer) 
      puts customer.to_json 
      courier =  Courier.find_by(user_id: user.id)
      puts "courier ====================="
      # puts JSON.stringify(courier) 
      puts courier.to_json
      

      if user && user.valid_password?(password)
        render json: { success: true,  user_id: user.id, customer_id: customer.id, courier_id: courier.id}
      else
        render json: { success: false }, status: :unauthorized
      end
    end
  end
end

