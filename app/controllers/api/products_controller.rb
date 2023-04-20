class Api::ProductsController < ApplicationController
    before_action :set_restaurant, only: [:index]
  
    def index
      @products = @restaurant ? @restaurant.products : Product.all
      render json: @products.map { |p| { id: p.id, name: p.name, cost: p.cost } }
    end
  
    private
  
    def set_restaurant
      @restaurant = Restaurant.find_by_id(params[:restaurant])
      render json: { error: "Invalid restaurant ID" }, status: :unprocessable_entity unless @restaurant
    end
  end