class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @color_id = params[:color_id]
    if @color_id == nil 
      redirect_to :looks
  end
end
