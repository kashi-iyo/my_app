class LikesController < ApplicationController

  before_action :authenticate_user

  def create
    @like = Like.new(
      post_id: params[:post_id],
      user_id: @current_user.id
    )
    if @like.save
      redirect_to("/posts/index")
    end
  end

  def destroy
    @like = Like.find_by(
      post_id: params[:post_id],
      user_id: @current_user.id
    )
    if @like.destroy
      redirect_to("/posts/index")
    end
  end
end
