class Pokemon < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rental, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :element ],
    associated_against: {
      user: [:username]
    },
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:name, :element, :rating]
end
