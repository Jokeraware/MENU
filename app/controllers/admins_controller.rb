class AdminsController < ApplicationController
  def index
    @admin = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def show
    @admin = current_admin
  end

  def edit
  end

  def create
  end

  def destroy
  end
end
