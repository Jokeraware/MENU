class FavoritesController < ApplicationController
    def create
      @favorite = current_user.favorites.new(favorite_params)
      @favorite.save
      redirect_to @favorite.restaurant
    end

    def destroy
      @favorite = current_user.favorites.find_by(restaurant_id: favorite_params)
      if @favorite.nil?
        flash[:alert] = 'Like not found.'
      else
        @favorite.destroy
        flash[:notice] = 'Like destroyed successfully.'
      end
      redirect_back(fallback_location: root_path)
    end

    private

    def favorite_params
        params.require(:favorite).permit(:restaurant_id)
    end
end
