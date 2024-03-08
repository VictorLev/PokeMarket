
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

url = "https://pokeapi.co/api/v2/pokemon/?limit=30"
pokemon_serialized = URI.open(url).read
api_return = JSON.parse(pokemon_serialized)

address = ["294 Swan St, Richmond VIC 3121",
            "Lvl 1/650 Collins St, Docklands VIC 3008",
            "12/62 Cook St, Port Melbourne VIC 3210",
            "115-129 Mt Alexander Rd, Flemington VIC 3031",
            "1/1-3 Cole St, Williamstown VIC 3016",
            "Brimbank Shopping Centre Cnr Station Rd &, Neale Rd, Deer Park VIC 3023",
            "154-156 Central Ave, Altona Meadows VIC 3028",
            "100 South Road Corner of, Hampton St, Hampton VIC 3188",
            "Stud Rd, Dandenong North VIC 3175",
            "Ballarto Rd, Frankston North VIC 3200",
            "Canterbury Rd, Vermont VIC 3133",
            "Grimshaw St &, Greensborough Rd, Greensborough VIC 3088",
            "504 Pascoe Vale Rd, Strathmore VIC 3044",
            "1445/1451 Hume Hwy, Campbellfield VIC 3061",
            "113 Matthews Ave, Airport West VIC 3042",
            "401 Moreland Rd, Coburg VIC 3058",
            "200 Rosamond Rd, Maribyrnong VIC 3032",
            "360 Canterbury Rd, Surrey Hills VIC 3127",
            "Canterbury Rd, Vermont VIC 3133",
            "Grimshaw St &, Greensborough Rd, Greensborough VIC 3088",
            "231-233 Ferntree Gully Rd, Mount Waverley VIC 3149",
          ]

User.destroy_all
Pokemon.destroy_all

User.create!(username: "Ash",
              hometown: "Pallet Town",
              email: "ash@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "ash"
              )
User.create!(username: "Misty",
              hometown: "Cerulean City",
              email: "misty@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "misty"
              )
User.create!(username: "Brock",
              hometown: "Pewter City",
              email: "brock@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "brock")

User.create!(username: "Jessie",
              hometown: "Unknown",
              email: "jessie@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "jessie"
              )
User.create!(username: "James",
              hometown: "Unknown",
              email: "james@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "james"
              )
User.create!(username: "Gary",
              hometown: "Pallet Town",
              email: "gary@pokemon.com",
              password: "secret",
              password_confirmation: "secret",
              imageUrl: "gary"
              )

User.create!(username: "victor", hometown: "canada", email: "victor@pokemon.com", password: "secret", password_confirmation: "secret", imageUrl: "pokemon-trainer")
User.create!(username: "jacopo",hometown: "italy", email: "jacopo@pokemon.com", password: "secret", password_confirmation: "secret", imageUrl: "pokemon-trainer")
User.create!(username: "mehnul", hometown: "india", email: "mehnul@pokemon.com", password: "secret", password_confirmation: "secret", imageUrl: "pokemon-trainer")
User.create!(username: "emma", hometown: "uk", email: "emma@pokemon.com", password: "secret", password_confirmation: "secret", imageUrl: "pokemon-trainer")

api_return["results"].each do |pokemon|
  url = pokemon["url"]
  pokemon_serialized = URI.open(url).read
  api_return = JSON.parse(pokemon_serialized)

  Pokemon.create!(nickname: pokemon["name"],
                  age: rand(1..30),
                  rating: rand(1...10),
                  element: api_return["types"][0]["type"]["name"],
                  name: pokemon["name"],
                  user: User.all.sample,
                  featured: [true, false].sample,
                  address: address.sample,
                  imageUrl: api_return["sprites"]["front_default"]
                  )
end
