require 'faker'


#Restaurant.destroy_all
#City.destroy_all
#User.destroy_all


all_cities = ["Marseille", "Toulouse", "Paris"]

20.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    city = Faker::Address.city
    email = "#{first_name}.#{last_name}@yopmail.com"

    User.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: 'password')
  end
  puts "5 users have been created"

all_cities.each do |city|
  City.create(city_name: city)
end

all_restaurants = ["Japonais", "Marocain", "Méditerranéen", "Thailandais"]
6.times do 
  Restaurant.create(
    restaurant_name: all_restaurants.sample,
    city: City.all.sample
  )
end


















