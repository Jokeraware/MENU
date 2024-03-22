class RestaurantsController < ApplicationController
  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @admin = current_admin
    @restaurant = Restaurant.new
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.admin = current_admin
    if @restaurant.save
      redirect_to root_path, notice: "Le restaurant a été créé avec succès."
    else
      render :new
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :city_id)
  end
end
