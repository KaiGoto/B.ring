class Place < ApplicationRecord
  belongs_to :region
  attachment :image
  has_many :comments, dependent: :destroy
  validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
  validates :explanation, presence: true, length:{maximum: 300}  #場所説明
end
