class Look < ActiveRecord::Base
  belongs_to :color
  belongs_to :room
  belongs_to :user
  has_many :votes, dependent: :destroy
end
