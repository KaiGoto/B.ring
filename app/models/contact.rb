class Contact < ApplicationRecord
   validates :name, presence: true, length:{minimum: 2,maximum: 30} #場所名
   validates :message, presence: true, length:{minimum: 2,maximum: 300} #メッセージ
end
