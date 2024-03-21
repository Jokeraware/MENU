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
    if current_user @admin
      @restaurant = Restaurant.new
    else
      redirect_to root_path, alert: "Vous n'avez pas les autorisations nécessaires pour accéder à cette page."
    end
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
