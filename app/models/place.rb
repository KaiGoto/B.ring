class Place < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :region
  attachment :image
  has_many :place_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
  validates :explanation, presence: true, length:{maximum: 300}  #場所説明
end
