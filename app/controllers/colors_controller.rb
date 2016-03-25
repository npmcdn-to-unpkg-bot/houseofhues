class ColorsController < ApplicationController

  def index
    @looks_boosts = Look.order(boosts: :desc).limit(3)
    @colors = Color.all
    @looks_newest = Look.order(created_at: :desc).limit(3)
  end

  def show
  end
end
