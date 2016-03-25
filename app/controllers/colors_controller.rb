class ColorsController < ApplicationController

  def index
    @looks=Look.order(boosts: :desc).limit(3)
    @colors = Color.all
    @looks=Look.order(created_at: :desc).limit(3)
  end

  def show
  end
end
