class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    @user = current_user
  end
end
