
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

url = "https://pokeapi.co/api/v2/pokemon/?limit=100"
pokemon_serialized = URI.open(url).read
api_return = JSON.parse(pokemon_serialized)

User.destroy_all if Rails.env.development?
Pokemon.destroy_all if Rails.env.development?

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
    coordinates: "[#{rand(-30..-20)}, #{rand(130..140)}]",
    imageUrl: api_return["sprites"]["front_default"]
  )
end
