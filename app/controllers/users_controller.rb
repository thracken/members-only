class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, member!"
      redirect_to root_path
    else
      flash.now[:error] = "Oops, something's not quite right."
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
