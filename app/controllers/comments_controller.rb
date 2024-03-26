class CommentsController < ApplicationController
  before_action :set_restaurant, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  def create
    restaurant = Restaurant.find(params[:restaurant_id])
    # .build Construire une nouvelle instance comment associé au gossip
    # .merge Ajoute ou remplace valeur user dans comment_params par current_user
    @comment = restaurant.comments.build(comment_params.merge(user: current_user))
    
    if @comment.save
      redirect_to restaurant_path(@restaurant), notice: "Comment was successfully created."
    else
      @body = params[:body]
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @comment.destroy

    redirect_to restaurant_path(@restaurant), notice: "Comment was successfully destroyed."
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
