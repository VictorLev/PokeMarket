class User < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pokemons, dependent: :destroy
  has_many :rentals, dependent: :destroy

  multisearchable against: [:username, :hometown]
end
