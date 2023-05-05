class Api::ProductsController < ApplicationController
  def index
    if params[:restaurant].present?
      restaurant = Restaurant.find_by(id: params[:restaurant])
      if restaurant.present?
        @products = Product.where(restaurant_id: restaurant.id).to_a
      else
        render json: { error: "Invalid restaurant ID" }, status: 422
        return
      end
    else
      @products = Product.all.to_a
    end
    render json: @products.map { |product| { id: product.id, name: product.name, cost: product.cost } }
  end
end