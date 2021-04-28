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

User.create!(
   email: "aaa@aaaa.com",
   last_name: "aaa",
   first_name: "aaa",
   k_last_name: "aaa",
   k_first_name: "aaa",
   nickname: "aaa",
   postal_code: "0000000",
   address: "aaa",
   telephone_number: "0601045678",
   password: "aaaaaa",
   is_valid: "true",
)

Region.create!(
   name: "南河内",
   )
