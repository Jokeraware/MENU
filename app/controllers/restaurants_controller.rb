class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
    @restaurant_name = Faker::Restaurant.name
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_name = Faker::Restaurant.name
  end
end
