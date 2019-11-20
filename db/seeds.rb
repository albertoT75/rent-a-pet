# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


10.times do
  Pet.create(name: Faker::Name.name, address: Faker::Address.full_address,
    breed: Faker::Creature::Animal.name, age: rand(1..20), description: Faker::Faker::Quote.most_interesting_man_in_the_world, user_id:1 )
end

# above .sample one random user from User.all

