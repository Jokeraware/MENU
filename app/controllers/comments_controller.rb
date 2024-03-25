class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :create, :update]

  def new
    @comment = Comment.new
  end

  def show
    @current_user = user
  end

  def create
    restaurant = Restaurant.find(params[:id])
    @comment = Comment.new(content: params[:content], restaurant: @restaurant)
    if @comment.save
      redirect_to root_path
    else
      render :restaurants
  end 

  def edit 
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy 
    @comment = Comment.find(params[:id])
    Comment.delete(@comment)
    return redirect_to root_path
  end

  private
  def authenticate_user
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def comment
    @comment = Comment.find(params[:id])
  end
end
