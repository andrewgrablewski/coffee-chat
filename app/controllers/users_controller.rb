class UsersController < ApplicationController
  before_action :check_if_logged_in?, only: [:new]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Coffee Chat"
      redirect_to root_path
    else
      flash.now[:error] = "Something has gone wrong with signup"
      render new
    end
  end



  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def check_if_logged_in?
    return unless logged_in?
    flash[:error] = "You are already logged in"
    redirect_to root_path
  end

end
