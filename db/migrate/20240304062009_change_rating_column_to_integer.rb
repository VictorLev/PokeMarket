class ChangeRatingColumnToInteger < ActiveRecord::Migration[7.1]
  def change
    change_column :pokemons, :rating, :decimal, precision: 2, scale: 1
  end
end
