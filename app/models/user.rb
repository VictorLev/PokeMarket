class User < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pokemon, dependent: :destroy
  has_many :rental, dependent: :destroy

  multisearchable against: [:username, :hometown]
end
