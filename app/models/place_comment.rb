class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :content, presence: true
  #空白で送信できない
end
