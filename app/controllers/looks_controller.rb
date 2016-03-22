class LooksController < ApplicationController

  def index
    @looks = Look.all
  end

  def new
    @look = Look.new
    @looks_id = params[:id]
  end

  def create
    @look = Look.new
    @look.user_id = params["user_id"]
    @look.img = params["look"]["img"]
    @look.title = params["look"]["title"]
    @look.save
 end

  def show
  end

  def destroy
  end

  def update
  end
end
