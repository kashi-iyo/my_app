class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
     if @post.save
       flash[:notice] = "投稿されたお"
       redirect_to("/posts/index")
     else
       @posts = Post.all.order(created_at: :desc)
       render("posts/index")
     end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "編集が完了したお"
      redirect_to("/posts/index")
    else
      render("posts/show")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "削除が完了したお"
    redirect_to("/posts/index")
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/#{params[:id]}/show")
    end
  end

end
