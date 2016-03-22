class Room < ActiveRecord::Base
  has_many :colors, through: :colorroom
  has_many :looks, through: :colorroom
  has_many :colorrooms
end
