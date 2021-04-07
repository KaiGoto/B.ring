class Admins::UsersController < ApplicationController
before_action :authenticate_admin!
  def index
    @user =User.page(params[:page]).per(10) #kaminari
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user), notice: "更新しました"
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :k_first_name, :k_last_name, :nickname, :postal_code, :address, :telephone_number, :email)
  end

end