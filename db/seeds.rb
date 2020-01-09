# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

50.times do |n|
    Landlord.create!(name: "Landlord #{n}")
end

file = File.open "#{__dir__}/world-cities_json.json"
world_cities = JSON.load file
file.close


100.times do |n|
    property = Property.new
    random_type = Property.property_types.keys.sample(1).first
    random_text = (0...200).map { ('a'..'z').to_a[rand(26)] }.join
    
    property.property_type = random_type
    property.title = "#{random_type} \##{n}"
    property.description = "Property #{n} type #{random_type} #{random_text}"
    property.width = rand(10..30)
    property.length = rand(10..50)
    property.price = rand(100.0 .. 1000000.0)
    property.landlord = Landlord.find(rand(1..50))

    random_address = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    random_world_city = world_cities.sample(1).first
    
    property.address = Address.new(description: random_address, country: random_world_city['country'], 
        city: random_world_city['name'])
    property.save
end
