class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :rental, dependent: :destroy
end
