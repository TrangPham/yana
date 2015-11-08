# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tim = User.new(
  name: 'Timothy Cheung',
  email: 'timothycheung@gmail.com',
  password: 'timothycheung',
  category: 'patient'
)
tim.save

michael = User.new(
  name: 'Michael Xie',
  email: 'michaelxie@gmail.com',
  password: 'michaelxie',
  category: 'patient'
)
michael.save

daniel = User.new(
  name: 'Daniel Chang',
  email: 'danielchang@gmail.com',
  password: 'danielchang',
  category: 'caregiver'
)
daniel.save

thu = User.new(
  name: 'Thu Trang Pham',
  email: 'thutrangpham@gmail.com',
  password: 'thutrangpham',
  category: 'patient'
)
thu.save

tom = User.new(
  name: 'Tom Choi',
  email: 'tomchoi@gmail.com',
  password: 'tomchoi',
  category: 'caregiver'
)
tom.save

# Stories
Story.create(
  user_id: tim.id,
  created_at: 1296864000,
  content:
  "During my going-away meeting with Gender Studies, the faculty gave me this
  journal. In it I’ll report my descent into the post-cerebral realm for which I
  am headed. No whimpering, no whining, no despair. Just the facts."
)
