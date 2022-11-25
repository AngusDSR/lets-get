# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Creating records"
Business.destroy_all
puts "All businesses destroyed"


User.create(
  email: "email@email.com",
  password: "password"
)

puts "Dummy user created"

Business.create(
  name:"Assembly House",
  description: "Greene King dog friendly pub",
  category: "Pub",
  street_address: "292-294 Kentish Town Road, London",
  image_url: "Assemblyhouse.jpg"
)
puts "Assembly house created"
Business.create(
  name:"Royal George",
  description: "Greene King company`s pub perfect for families",
  category: "Pub",
  street_address: "8-14 Eversholt Street, Euston, Greater London",
  image_url: "theroyalgeorge.jpg"
)
puts "Royal George created"
Business.create(
  name:"Fitzrovia",
  description: "Greene King company`s pub perfect for sport",
  category: "Coffee",
  street_address: "18 Goodge Street, Bloomsbury, Greater London",
  image_url: "TheFitzrovia.jpg"
)
puts "Fitzrovia created"
Business.create(
  name:"TRAVELLERS TAVERN",
  description: "Greene King company`s waterside pub",
  category: "Restaurant",
  street_address: "4 Elizabeth Street, Belgravia, London",
  image_url: "travellerstavern.jpg"
)
puts "TRAVELLERS TAVERN created"