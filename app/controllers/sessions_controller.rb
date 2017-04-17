class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_with_credentials(params[:user][:email],params[:user][:password])
      session[:user_id] = user.id
      session[:user_admin] = user.admin
      flash[:success] = "Logged in as #{user.email}"
      redirect_to root_path
    else
      flash[:danger] = "Could not login with the provided info"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil unless !session[:user_id]
    session[:user_admin] = nil unless !session[:user_admin]
    flash[:info] = "Logged out successfully!"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:email,:password)
  end
  
end
