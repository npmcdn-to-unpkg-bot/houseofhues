class LooksController < ApplicationController
    before_action :authenticate_user!

  def index
    @looks = Look.all
  end

  def new
    @look = Look.new

    @color_id = params[:color_id]
    @room_id = params[:room_id]

    @color_name = Color.find(@color_id).name
    @room_name = Room.find(@room_id).name
  end

  def create
    @look = current_user.looks.build
    @look.user_id = params["look"]["user_id"]
    @look.img = params["look"]["img"]
    @look.title = params["look"]["title"]

    @look.user_id = current_user.id
    @look.color_id = params[:color_id]
    @look.room_id = params[:room_id]

    @look.save

    render :text => '<script type="text/javascript">alert("Look Added!"); window.close(); window.opener.location.reload(false);</script>'
    end

  def search
    @color_id = params[:color_id]
    @room_id = params[:room_id]
    @user_id = params[:user_id]

    if @room_id == nil
      redirect_to controller: "rooms", action: "index", color_id: @color_id
      else if @color_id != nil && @room_id != nil
        @looks = Look.where(color_id: @color_id, room_id: @room_id)
        @color_name = Color.find(@color_id).name
        @room_name = Room.find(@room_id).name
      end
    end
  end

  def show
  end

  def destroy
    @look = Look.find(params[:id])
    @look.destroy
    redirect_to :back
  end

  def update
  end

  # def trend
  #   @looks = Look.find(params[:boosts])
  #   @looks.look_items.first.move_to_bottom
  #   @looks.look_items.last.move_higher
  # end

  def upvote
    @look = Look.find(params[:id])
    Look.increment_counter(:boosts, params[:id])
    @look.votes.create
    redirect_to(looks_path)
  end
end
