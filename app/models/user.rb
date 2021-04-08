class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :k_last_name, presence: true
         validates :k_last_name, presence: true
         validates :nickname, presence: true
         validates :postal_code, presence: true, length: { is: 7, message: 'は7桁で入力してください' }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
         validates :address, presence: true
         validates :telephone_number,presence: true, uniqueness: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10桁または11桁で入力してください' }
         validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i, message: 'は半角英数字で入力してください' }

  has_many :places, dependent: :destroy
  has_many :place_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
