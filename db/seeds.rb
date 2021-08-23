# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.destroy_all

puts "seeding recipes..."

5.times do
    Recipe.create(title: Faker::Food.dish, instructions: Faker::Lorem.sentence(word_count: 55), minutes_to_complete: rand(20..50), user_id: rand(1..2))
end