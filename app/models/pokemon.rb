class Pokemon < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :rental, dependent: :destroy

  def unavailable_dates
    self.rental.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end


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
