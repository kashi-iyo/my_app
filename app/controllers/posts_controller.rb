class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
     if @post.save
       flash[:notice] = "投稿されたお"
       redirect_to("/posts/index")
     else
       render("posts/new")
     end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.contet = params[:content]
    if @post.save
      flash[:notice] = "編集が完了したお"
      redirect_to("/posts/index")
    else
      render("posts/show")
    end
  end

end
