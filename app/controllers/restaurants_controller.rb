class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @admin = Admin.new
    @restaurant = Restaurant.new
  end


def create
  @restaurant = Restaurant.new(restaurant_name: params[:restaurant_name])
  if @restaurant.save
    redirect_to root_path, notice: "Le restaurant a été créé avec succès."
  else
    render :new
  end
end
end
