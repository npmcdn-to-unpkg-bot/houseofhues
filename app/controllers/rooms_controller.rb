class RoomsController < ApplicationController
  def create
    @colors = Color.all
    @rooms = Room.all
  end
end
