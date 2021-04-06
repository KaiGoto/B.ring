class Region < ApplicationRecord
  has_many :places

  validates :name, presence: true, uniqueness: true
end
