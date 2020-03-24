class ApplicationController < ActionController::Base
before_action :set_current_user

#  ログインしているユーザーを定義
def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end

# ログインしていない場合のアクセス制限
def authenticate_user
  if @current_user == nil
    flash[:notice] = "さーせん、アクセス権限がないっす"
    redirect_to("/users/new")
  end
end

# ログインしている場合のアクセス制限
def forbid_login_user
  if @current_user != nil
    flash[:notice] = "すでにログインしてるんだよなぁ"
    redirect_to("/posts/index")
  end
end

end
