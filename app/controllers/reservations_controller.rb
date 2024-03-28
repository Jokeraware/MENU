class ReservationsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]

  def index
    @reservations = Reservations.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end
  
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to @restaurant, notice: 'La réservation a été prise en compte.'
    else
      render 'restaurants/show'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    # search for specifically "id"
    @reservation = current_user.reservations.find_by(id: params[:id]) || current_admin.reservations.find_by(id: params[:id])
    if @reservation
      @reservation.destroy
      redirect_to root_path, notice: "La réservation a été supprimée avec succès!"
    else
      redirect_to user_path, alert: "La réservation que vous essayez de supprimer n'existe pas ou vous n'êtes pas autorisé à la supprimer."
    end
  end
  

  private

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def reservation_params
    params.require(:reservation).permit(:number, :date, :time, :restaurant_id, :user_id)
  end

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end
end