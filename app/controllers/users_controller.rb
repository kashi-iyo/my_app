class UsersController < ApplicationController

  before_action :ensure_correct_user, {only: [:edit, :update]}
  before_action :authenticate_user, {only: [:index, :show, :edit, :update, :logout]}

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_img.png"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "登録が完了したお"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = "編集が完了したお"
      redirect_to("/users/index")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしたお"
      redirect_to("/users/#{session[:user_id]}/show")
    else
      @error_message = "メールアドレスまたは、パスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしたお"
    redirect_to("/users/login_form")
  end

  # ログインしているユーザーと、編集したいユーザーページが異なる場合、アクセス制限
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "あなたのアカウントではないので、入れません"
      redirect_to("/posts/index")
    end
  end

end
