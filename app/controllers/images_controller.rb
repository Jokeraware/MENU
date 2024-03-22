class ImagesController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.image.attach(params[:image])
    redirect_to(restaurant_path(@restaurant))
  end
end
