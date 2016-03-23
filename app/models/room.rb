class Room < ActiveRecord::Base
  has_many :color_rooms
  has_many :colors, through: :color_rooms
  has_many :looks, through: :color_rooms
end
