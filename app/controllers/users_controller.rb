class UsersController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def create
  end

  def show
  @user = User.find(params[:id])
  @user_email = @user.email
  @last_login = @user.last_sign_in_at

  @number_looks = Look.where(user_id: @user.id).length

  @avatar = @user.avatar
  @looks = @user.looks.order(created_at: :desc)
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    redirect_to "/looks/:id"
  end

end
