class AvatarsController < ApplicationController
    def create
      @user = User.find(params[:user_id])
      # Search if avatar is present or not
      @user.avatar.attach(params[:avatar])
      redirect_to(user_path(@user))
    end
end
