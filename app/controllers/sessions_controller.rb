class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:user_admin] = user.admin
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil unless !session[:user_id]
    session[:user_admin] = nil unless !session[:user_admin]
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end
  
end
