class AddFeaturedToPokemon < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :featured, :boolean, default: false
  end
end
