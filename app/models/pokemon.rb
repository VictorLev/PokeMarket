require 'open-uri'

class Pokemon < ApplicationRecord
  before_validation :fetch_img_url
  belongs_to :user
  has_many :rentals, dependent: :destroy

  def unavailable_dates
    self.rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end


  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :element ],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:name, :element, :rating]

  private

  def fetch_img_url
    # Call the api using name of Pokemon
    url = "https://pokeapi.co/api/v2/pokemon/#{self.name}/"
    pokemon_serialized = URI.open(url).read
    api_return = JSON.parse(pokemon_serialized)
    # Grab the imgUrl and add as attribute to the Pokemon
    img_url = api_return["sprites"]["front_default"]
    self.imageUrl = img_url
  rescue
    errors.add(:base, "This pokemon does not exist...")
  end
end
