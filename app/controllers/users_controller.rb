class UsersController < ApplicationController
  def index

  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = current_user
    @reservations = @user.reservations
  end

  def create
  @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Le compte client a été créé." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Votre compte a été mis à jour."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :city)
  end
end

