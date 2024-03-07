class AddGeocoordinatesToPokemons < ActiveRecord::Migration[7.1]
  def change
    add_column :pokemons, :latitude, :float
    add_column :pokemons, :longitude, :float
  end
end
.eyJ1IjoiZW1zdG8iLCJhIjoiY2x0Z3BoZTR0MTNncDJ0bWh5Ym82cWVpbyJ9.sTNryVBzkqrjSTB_Wfpnqw
