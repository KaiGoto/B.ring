class Public::UserController < ApplicationController
before_action :authenticate_user!
  def show
    @user = current_user
  end

  def update
    @user = currenr_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
    @user = currenr_user
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :k_first_name, :k_last_name, :nickname, :postal_code, :address, :telephone_number, :email)
  end
end
