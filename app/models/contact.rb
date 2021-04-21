class Contact < ApplicationRecord
   validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
   validates :email, presence: true, format: { with: /\A\d{10,11}\z/, message: 'は半角数字10桁または11桁で入力してください' }  #メールアドレス
   validates :message, presence: true, length:{minimum: 2,maximum: 300} #メッセージ
end
