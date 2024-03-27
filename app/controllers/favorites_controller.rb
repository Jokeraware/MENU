class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @user = current_user.id 
    @restaurant = params[:restaurant_id]
    favorites = {user_id: @user, restaurant_id: @restaurant}
    @favorite = Favorite.new(favorites)

    @favorite.save!
    if @favorite.save
      redirect_to restaurant_path(@restaurant), notice: 'Le restaurant a été ajouté en favoris'
    end
  end
end
