class ReservationsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end
  
    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @reservation = @restaurant.reservations.build(reservation_params)
      @reservation.user = current_user

      if @reservation.save
        redirect_to @restaurant, notice: 'Reservation was successfully created.'
      else
        render 'restaurants/show'
      end
    end
  
    def show
      @reservation = Reservation.find(params[:id])
    end
  
    private
    def reservation_params
      params.require(:reservation).permit(:date, :time, :restaurant_id, :user_id)
    end

    def require_login
      unless current_user
        redirect_to new_user_session_path
      end
    end
  end
  