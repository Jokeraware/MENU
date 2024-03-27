class FavoritesController < ApplicationController
    def create
      @favorite = current_user.favorites.new(favorite_params)
      @favorite.save
      redirect_to @favorite.restaurant
    end

    def destroy
      @favorite = current_user.favorites.find_by(id: params[:id])
      if @favorite
        @favorite.destroy
        flash[:notice] = 'Like destroyed successfully.'
      else
        flash[:alert] = 'Like not found.'
      end
      redirect_back(fallback_location: root_path)
    end

    
    

    private

    def favorite_params
        params.require(:favorite).permit(:restaurant_id)
    end
end
