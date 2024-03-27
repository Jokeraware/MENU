class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.new(favorite_params)
      if @favorite.save
        flash[:notice] = 'Restaurant added to favorites successfully.'
      else
        flash[:alert] = 'Failed to add restaurant to favorites.'
      end
      redirect_to @favorite.restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @favorite = current_user.favorites.find_by(restaurant_id: @restaurant.id)
    if @favorite
      @favorite.destroy
      flash[:notice] = 'Restaurant removed from favorites successfully.'
    else
      flash[:alert] = 'Failed to remove restaurant from favorites.'
    end
      redirect_to @restaurant
  end

    
  private

  def favorite_params
      params.require(:favorite).permit(:restaurant_id)
  end
end
