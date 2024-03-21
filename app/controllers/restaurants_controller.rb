class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
    @restaurant_name = Faker::Restaurant.name
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @restaurant_name = Faker::Restaurant.name
  end
  def new
    @restaurant = Restaurant.new
  end

def create
  @restaurant = Restaurant.new(params[:id])
  if @restaurant.save
    redirect_to @restaurant, notice: "Le restaurant a été créé avec succès."
  else
    render :new
  end
end
end
