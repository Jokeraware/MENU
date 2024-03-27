class RestaurantsController < ApplicationController
  before_action :authorize_admin, only: [:destroy]

  def index
    @restaurants = Restaurant.all
    # .joins joins restaurant to city
    # .where find all restaurants associated to a city_name = params[:city](value in filter)
    @restaurants = @restaurants.joins(:city).where(cities: { city_name: params[:city] }) if params[:city].present?
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = @restaurant.comments
    @reservation = Reservation.new
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

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to root_path
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: 'Le restaurant a été mis à jour.'
    else
      render :edit
    end
  end

  
  private
  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :city_id , :image)
  end

  def authorize_admin
    @restaurant = Restaurant.find(params[:id])
    unless current_admin == @restaurant.admin
      redirect_to root_path
    end
  end
end
