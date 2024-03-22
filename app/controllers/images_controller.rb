class ImagesController < ApplicationController
  def create
    @admin = Admin.find(params[:admin_id])
    @admin.image.attach(params[:image])
    redirect_to(admin_path(@admin))
  end
end
