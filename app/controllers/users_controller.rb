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
end
