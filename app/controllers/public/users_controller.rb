class Public::UsersController < ApplicationController
before_action :authenticate_user!
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
    @user = current_user
  end
  
  def confirm
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:image, :last_name, :first_name, :k_first_name, :k_last_name, :nickname, :postal_code, :address, :telephone_number, :email)
  end
end
