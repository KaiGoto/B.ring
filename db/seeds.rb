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
#    email: "test@test.com",
#    last_name: "test",
#    first_name: "test",
#    k_last_name: "test",
#    k_first_name: "test",
#    nickname: "test",
#    postal_code: "0620934",
#    address: "北海道札幌市豊平区平岸4条13-8",
#    telephone_number: "07012345678",
#    password: "aaaaaa",
#    is_valid: "true",
# )
