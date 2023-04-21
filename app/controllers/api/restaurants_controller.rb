class Api::RestaurantsController < ApplicationController
  def index
      rating = params[:rating]
      price_range = params[:price_range]

      if is_number_in_range?(rating, 1, 5) && is_number_in_range?(price_range, 1, 3)
        @restaurants = Restaurant.rating_and_price(rating, price_range)
        render json: @restaurants, status: :ok
      else
        render_422_error("Invalid rating or price range")
      end
  end

  def is_number_in_range?(number, min, max)
      number.nil? || number.empty? || (min..max).include?(number.to_i)
  end

  def render_422_error(message)
      render json: { error: message }, status: :unprocessable_entity
  end
end