class CitiesController < ApplicationController
  def new
    @city = City.new
  end
  
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to root_path, notice: "La ville a été créée avec succès."
    else
      render :new
    end
  end

  private
  def city_params
    params.require(:city).permit(:city_name)
  end
end
