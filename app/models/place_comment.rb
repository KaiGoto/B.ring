class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  
  validates :comment, presence: true, length:{maximum: 100}  #コメント
end
