Rails.application.routes.draw do
  resources :courier_statuses
  resources :couriers
  resources :product_orders
  resources :orders
  resources :order_statuses
  resources :employees
  resources :products
  resources :customers
  resources :restaurants
  resources :addresses
  devise_for :users
  root to: "home#index" 
end
