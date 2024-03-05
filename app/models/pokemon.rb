class Pokemon < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rental, dependent: :destroy
end
