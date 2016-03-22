class RoomsController < ApplicationController
  def index
    @colors = Color.all
    @rooms = Room.all
  end

  def create
    raise
  end
end
