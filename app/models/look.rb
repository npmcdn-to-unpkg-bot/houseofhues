class Look < ActiveRecord::Base
  belongs_to :colorroom
  belongs_to :user
  has_many :look_items, -> { order(position: :asc) }
end

class LookItem < ActiveRecord::Base
  belongs_to :look
  acts_as_list scope: :look
end
