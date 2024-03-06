class AddImagesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :imageUrl, :string
  end
end
