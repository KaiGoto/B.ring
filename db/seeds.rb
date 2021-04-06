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
   email: "aaa@aaa.com",
   last_name: "aaa",
   first_name: "aaa",
   k_last_name: "aaa",
   k_first_name: "aaa",
   nickname: "aaa",
   postal_code: "0000000",
   address: "大阪府大阪市中央区1-1-1",
   telephone_number: "06012345678",
   password: "aaaaaa",
   is_valid: "true",
)

# Region.create!(
#    name: "松原市"
# )

# Place.create!(
#    region_id: "1",
#    image: File.open("./app/assets/images/sample.jpeg"),
#    name: "はーとビュー（人権交流センター）",
#    ground: "コンクリート",
#    explanation: "フルコートでリングも２つあり、土日は地元松原市の学生たちで賑わっています。",
# )
