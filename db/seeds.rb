# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

# 5.times { |i|
#   Employee.create([{
#     fname: Faker::Name.first_name,
#     lname: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     emp: "E0#{i + 1}",
#     password: "123456",
#     password_confirmation: "123456",
#   }])
# }
# 5.times { |i|
#   Tag.create([{
#     tag_name: "Activity #{i + 1}",
#   }])
# }
# 5.times { |i|
#   Challenge.create([{
#     title: "Challenge #{i + 1}",
#     description: "Description for Challenge #{i + 1}",
#     tag: "Activity #{i + 1}",
#     employee_id: i + 1,
#   }])
# }
