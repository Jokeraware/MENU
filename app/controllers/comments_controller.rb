class CommentsController < ApplicationController
  before_action :set_restaurant, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    # .build Create a new instance comment associated to restaurant
    # .merge Add or replace user value in comment_params by current_user
    @comment = restaurant.comments.build(comment_params.merge(user: current_user))
    
    if @comment.save
      redirect_to restaurant_path(@restaurant), notice: "Le commentaire a été ajouté."
    else
      @body = params[:body]
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @comment.destroy

    redirect_to restaurant_path(@restaurant), notice: "Le commentaire a été supprimé."
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_comment
    @comment = @restaurant.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
