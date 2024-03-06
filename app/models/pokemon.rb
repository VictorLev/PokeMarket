class Pokemon < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rental, dependent: :destroy

  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_element,
  #   against: [ :name, :element ],
  #   using: {
  #   tsearch: { prefix: true }
  # }
end
