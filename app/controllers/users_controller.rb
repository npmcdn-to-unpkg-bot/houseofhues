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
  @collection = @user.looks
  # @boosts_received = @user.boosts
  #submitted looks
  #boosts recieved
  #boosts given
  end

  def collection
    @user = User.find(params[:id])
    @user_email = @user.email
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    redirect_to "/looks/:id"
  end

end
