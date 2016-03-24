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
    #@look.acts_as_list = params["look"]["boosts"]
  end

  def search
    @color_id = params[:color_id]
    @room_id = params[:room_id]

    if @room_id == nil
      redirect_to controller: "rooms", action: "index", color_id: @color_id
      else if @color_id != nil && @room_id != nil
        @looks = Look.where(color_id: @color_id, room_id: @room_id)
      end
    end
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

  def upvote
    @look = Look.find(params[:id])
    @look.votes.create
    redirect_to(looks_path)
  end

end
