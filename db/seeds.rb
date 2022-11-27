puts "Creating records"
Business.destroy_all
puts "All businesses destroyed"

User.create(
  email: "email@email.com",
  password: "password"
)
puts "Dummy user created"

Business.create(
  name: "placeholder",
  description: "placeholder",
  category: "Pub",
  street_address: "placeholder",
  image_url: "placeholder"
)
puts "Placeholer created"

# Business.create(
#   name: "Assembly House",
#   description: "Greene King dog friendly pub",
#   category: "Pub",
#   street_address: "292-294 Kentish Town Road, London",
#   image_url: "Assemblyhouse.jpg"
# )
# puts "Assembly house created"
# Business.create(
#   name: "Royal George",
#   description: "Greene King company`s pub perfect for families",
#   category: "Pub",
#   street_address: "8-14 Eversholt Street, Euston, Greater London",
#   image_url: "theroyalgeorge.jpg"
# )
# puts "Royal George created"
# Business.create(
#   name: "Fitzrovia",
#   description: "Greene King company`s pub perfect for sport",
#   category: "Coffee",
#   street_address: "18 Goodge Street, Bloomsbury, Greater London",
#   image_url: "TheFitzrovia.jpg"
# )
# puts "Fitzrovia created"
# Business.create(
#   name: "Traveller's Tavern",
#   description: "Greene King company`s waterside pub",
#   category: "Restaurant",
#   street_address: "4 Elizabeth Street, Belgravia, London",
#   image_url: "travellerstavern.jpg"
# )
# puts "Traveller's Tavern created"
