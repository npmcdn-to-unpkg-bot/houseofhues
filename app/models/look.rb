class Look < ActiveRecord::Base
  belongs_to :color
  belongs_to :room
  belongs_to :user
end
