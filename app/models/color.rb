class Color < ActiveRecord::Base
  has_many :colorrooms
  has_many :rooms, through: :colorrooms
end
