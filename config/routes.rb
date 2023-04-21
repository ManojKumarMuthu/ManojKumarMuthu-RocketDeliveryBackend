Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :employees

  namespace :api do
    post '/login',  to: 'auth#index'
    post '/order/:id/status', to: 'orders#status'
    get '/orders', to: 'orders#index'
    post '/orders', to: 'orders#create'
    get '/products', to: 'products#index'
    resources :restaurants
  end 
end



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
    
#     resources :restaurants do
#       get :all, on: :collection
#     end
#   end 
# end

