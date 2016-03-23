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

 def findcrid
   @color_id = params[:color_id]
   @room_id = params[:room_id]
   @colorroom_id = ColorRoom.find_by(color_id: @color_id, room_id: @room_id)

   redirect_to look_path(3)
 end

  def show
    @looks = Look.find_by(color_room_id: @colorroom_id)
  end

  def destroy
  end

  def update
  end
end
