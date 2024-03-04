class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :hometown
      t.string :username

      t.timestamps
    end
  end
end
