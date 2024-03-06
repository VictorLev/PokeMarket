class AddCoordinatesToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :coordinates, :string
    add_column :pokemons, :imageUrl, :string
  end
end
