class Color < ActiveRecord::Base
  has_many :rooms
  has_many :looks
end
