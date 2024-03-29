class AdminsController < ApplicationController
  def new
    @admin = Admin.new
    @restaurant = Restaurant.new
  end

  def show
    @admin = current_admin
    @reservations = @admin.reservations #adminReservation
  end

  def edit
  end

  def create
    @admin = Admin.create(admin_params)
  
      respond_to do |format|
        if @admin.save
          format.html { redirect_to admin_url(@admin), notice: "Le compte professionnel a été créé." }
          format.json { render :show, status: :created, location: @admin }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @admin = Admin.find(params[:id])
      if @admin.update(admin_params)
        flash[:notice] = "Le compte a bien été mis à jour."
        redirect_to admin_path(current_admin)
      else
        render :edit
      end
    end

  def destroy
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :city)
  end
end
