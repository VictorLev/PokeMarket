class RenameCoordinatesToAddressInPokemons < ActiveRecord::Migration[7.1]
  def up
    rename_column :pokemons, :coordinates, :address
  end

  def down
    rename_column :pokemons, :address, :coordinates
  end
end
