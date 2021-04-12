class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :comment, presence: true
  #空白で送信できない
end
