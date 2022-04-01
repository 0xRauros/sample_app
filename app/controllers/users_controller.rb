class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # same: redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private
# Since user_params will only be used internally by
# the Users controller and need not be exposed to
# external users via the web, we’ll make it private using Ruby’s private keyword
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
