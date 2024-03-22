class Admins::RestaurantsController < ApplicationController
    before_action :authorized?

    def index
      @restaurants = Item.all
    end
    
    def show 
      @restaurant = Item.find(params[:id])
    end
    

    
    def new
      @restaurants = Item.all
      @restaurant = Item.new
    end

    def create
        @restaurant= Restaurant.new(params[:id])
        if @restaurant.save
            redirect_to @restaurant, notice: "Le restaurant a été créé avec succès."
        else
          render :new
        end
      end
end
