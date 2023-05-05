# Rails.application.routes.draw do
#   root to: "home#index"
#   devise_for :users
#   resources :employees

#   namespace :api do
#     post '/login',  to: 'auth#index'
#     post '/order/:id/status', to: 'orders#status'
#     get '/orders', to: 'orders#index'
#     post '/orders', to: 'orders#create'
#     get '/products', to: 'products#index'
#     resources :restaurants
#   end 
# end



Rails.application.routes.draw do
  resources :courier_statuses
  resources :couriers
  resources :product_orders
  resources :orders
  resources :order_statuses
  resources :products
  resources :customers
  resources :restaurants
  resources :employees
  resources :addresses
  devise_for :users
  root to: "home#index"
  # GET routes
  get '/users', to: 'users#index'
  get 'products', to: 'products#index'
  namespace :api do
    get '/orders', to: 'orders#index', as: 'api_orders'
    post 'login', to: 'auth#index'
    get "restaurants", to: "restaurants#index"
    get "products", to: "products#index"
    # get '/restaurants/:restaurant_id/products', to: 'products#index', as: 'restaurant_products' # correct routes
    get '/restaurants/:restaurantId/products', to: 'products#index', as: 'restaurant_products'  #update route
    # get '/api/ord', to: 'orders#index', as: 'api_orders'
    get '/api/orders', to: 'orders#index', as: :root
    resources :orders, only: [:index, :create] do
      namespace :api do
        post '/api/order/#{@order.id}/status', to: 'orders#update_order_status', as: 'api_update_order_status'
      end
    end
  end
end

