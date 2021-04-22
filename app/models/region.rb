class Region < ApplicationRecord
  has_many :places

  validates :name, presence: true, uniqueness: true　#地域名
end
