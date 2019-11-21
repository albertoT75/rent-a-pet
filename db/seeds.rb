# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
puts "Destroy previous users"
User.destroy_all
puts "Destroy previous users"
Pet.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
USER = User.create(username: "Johan Cruyff", email: "JC@rap.com", password: "123456")

addresses = ["Leopoldstraße 50, Berlin",
                                  "Brandenburgische Straße 22, Berlin",
                                  "Genslerstraße 21, Berlin",
                                  "Leopoldßtraße 82, Berlin",
                                  "Holteistraße 18, Berlin",
                                  "Weisbachstraß2 1-4, Berlin",
                                  "Schulweg, Berlin",
                                  "Lichtenberger Straße, Berlin",
                                  "Jacobystraße 5-6, Berlin",
                                  "Bornholmer Straße 2, Berlin"]

10.times do
  Pet.create(
    name: Faker::GreekPhilosophers.name,
    address: addresses.pop,
    breed: Faker::Creature::Animal.name,
    age: rand(1..20),
    description: Faker::Quote.most_interesting_man_in_the_world,
    user_id: USER.id )
 # puts "created pet number #{counter}"
end

# above .sample one random user from User.all

