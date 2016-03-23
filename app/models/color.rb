class Color < ActiveRecord::Base
  has_many :color_rooms
  has_many :rooms, through: :color_rooms
end
