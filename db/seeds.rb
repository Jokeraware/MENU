# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
City.destroy_all
Restaurant.destroy_all

restau_paris = ["Le Pantruche", "Basis", "Acà", "La Rêverie", "Lasserre"]
restau_marseille = ["La Tête de Chou", "La Fontaine", "Ourea", "La Cantine", "Gingembre"]
restau_toulouse = ["Susanoo", "Tommy's City Diner", "Aux Pieds sous la Table", "Kong Bap", "Bloomy Bistronomie Végétale"]
all_cities = ["Marseille", "Toulouse", "Paris"]

20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    city = all_cities.sample
    email = "#{first_name}.#{last_name}@yopmail.com"
    
    User.create(
      first_name: first_name,
      last_name: last_name,
      city: city,
      email: email,
      password: 'password')
  end
  puts "5 users have been created"

all_cities.each do |city|
  City.create(city_name: city)
end

restau_paris.each do |restau|
  Restaurant.create(restaurant_name: "restau", city_name: "Paris")
end
puts "5 restau have been created"













