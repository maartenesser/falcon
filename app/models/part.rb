class Part < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :claim
  belongs_to :order, optional: true

  validates :claim_id, presence: true
  validates :part_model_code, presence: true
  validates :car_id, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
  validates :order_id, presence: true

  include PgSearch
  pg_search_scope :global_search,
    against: [ :title, :description, :category, :part_model_code ],
    associated_against: {
      user: [ :company_name, :address ],
      claim: [:number]
    },
    using: {
      tsearch: { prefix: true }
    }
end
