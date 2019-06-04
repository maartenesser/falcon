class Part < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :claim

  has_one :order

  mount_uploader :photo, PhotoUploader
  monetize :price_cents

  validates :part_model_code, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :photo, presence: true

  include PgSearch
  pg_search_scope :global_search,
    against: %i[title description category part_model_code],
    associated_against: {
      user: %i[company_name first_name last_name],
      claim: [:number]
    },
    using: {
      tsearch: { prefix: true }
    }
end
