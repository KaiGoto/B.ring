# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'test@test.com',
   password: 'testtest'
)

# User.create!(
#    email: 'a@a.com',
#    last_name: 'a',
#    first_name: 'a',
#    k_last_name: 'a',
#    k_first_name: 'a',
#    nickname: 'a',
#    postal_code: '0000000',
#    address: '大阪府大阪市中央区1-1-1',
#    telephone_number: '00000000000',
# )