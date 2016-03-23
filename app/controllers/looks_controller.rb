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
    @look.user_id = params["look"]["user_id"]
    @look.img = params["look"]["img"]
    @look.title = params["look"]["title"]
    @look.color = params["look"]["color_room_id"]
    @look.save
    @look.acts_as_list = params["look"]["boosts"]
 end

  def show
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    redirect_to "/looks"
  end

  def update
  end

  def trend
    @looks = Look.find(params[:boosts])
    @looks.look_items.first.move_to_bottom
    @looks.look_items.last.move_higher
  end

end 
