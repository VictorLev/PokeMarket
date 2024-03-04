class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :nickname
      t.integer :age
      t.decimal :rating, precision: 2, scale: 1
      t.references :user, null: false, foreign_key: true
      t.string :element
      t.string :name

      t.timestamps
    end
  end
end
