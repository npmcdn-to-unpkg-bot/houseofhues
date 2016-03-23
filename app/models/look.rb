class Look < ActiveRecord::Base
  belongs_to :color_room
  belongs_to :user
  has_many :look_items, -> { order(position: :asc) }
  has_many :votes, dependent: :destroy
end

class LookItem < ActiveRecord::Base
  belongs_to :look
  acts_as_list scope: :look
end
