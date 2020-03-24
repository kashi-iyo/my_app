class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new

  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_img.png"
    )
    if @user.save
      flash[:notice] = "登録が完了したお"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
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
end
