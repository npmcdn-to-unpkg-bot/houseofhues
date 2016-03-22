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
  @avatar = @user.avatar
  #submitted looks
  #boosts recieved
  #boosts given
  end

  def collection
    @user = User.find(params[:id])
    @user_email = @user.email
  end

end
