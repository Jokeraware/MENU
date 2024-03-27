class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.new(favorite_params)
      if @favorite.save
        flash[:notice] = 'Le restaurant est ajouté aux favoris'
      else
        flash[:alert] = "Erreur, le restaurant n'a pas été ajouté aux favoris"
      end
      redirect_to @favorite.restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @favorite = current_user.favorites.find_by(restaurant_id: @restaurant.id)
    if @favorite
      @favorite.destroy
      flash[:notice] = "Le restaurant n'est plus dans les favoris."
    else
      flash[:alert] = "Erreur, le restaurant n'a pas été supprimé des favoris."
    end
      redirect_to @restaurant
  end

    
  private

  def favorite_params
      params.require(:favorite).permit(:restaurant_id)
  end
end
