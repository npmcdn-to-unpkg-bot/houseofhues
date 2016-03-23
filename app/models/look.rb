class Look < ActiveRecord::Base
  belongs_to :color_room
  belongs_to :user
end
