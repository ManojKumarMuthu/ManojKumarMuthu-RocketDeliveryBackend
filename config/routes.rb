# Rails.application.routes.draw do
#   resources :courier_statuses
#   resources :couriers
#   resources :product_orders
#   resources :orders
#   resources :order_statuses
#   resources :employees
#   resources :products
#   resources :customers
#   resources :restaurants
#   resources :addresses
#   devise_for :users
#   root to: "home#index" 
# end



Rails.application.routes.draw do
  devise_for :users
  post '/api/login',  to: 'api/auth#index'
  root to: "home#index"
  resources :employees
  namespace :api do
    resources :restaurants
    post '/order/:id/status', to: 'orders#status'
    get '/orders', to: 'orders#index'
    post '/orders', to: 'orders#create'
    get '/products', to: 'products#index'
  end
end