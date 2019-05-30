class Claim < ApplicationRecord
  has_many :parts
  belongs_to :user

  validates :number, presence: true
  validates :at_date, presence: true
  validates :description, presence: true

  include PgSearch
  pg_search_scope :global_search,
    against: %i[number at_date description],
    associated_against: {
      parts: %i[part_model_code category title description],
      cars: %i[make model vin]
    },
    using: {
      tsearch: { prefix: true }
    }

end
