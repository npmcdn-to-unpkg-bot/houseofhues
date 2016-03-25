class ColorsController < ApplicationController

  def index
    @looks=Look.order(boosts: :desc).limit(3)
    @colors = Color.all
  end

  def show
  end
end
