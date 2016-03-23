class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @color_id = params[:color_id]
  end
end
