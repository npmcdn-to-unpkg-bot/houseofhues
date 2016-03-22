class ColorRoom < ActiveRecord::Base
  belongs_to :color
  belongs_to :room
  has_many :looks
end
