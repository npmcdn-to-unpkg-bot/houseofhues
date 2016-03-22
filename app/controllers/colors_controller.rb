class ColorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @colors = Color.all
  end

  def show
  end
end
