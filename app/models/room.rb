class Room < ActiveRecord::Base
  has_many :colors
  has_many :looks
end
