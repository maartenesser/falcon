class Claim < ApplicationRecord
  has_many :parts
  belongs_to :user
  has_many :notifications, dependent: :delete_all
  validates :number, presence: true
  validates :at_date, presence: true
  validates :description, presence: true
  validates :garage_id, presence: true
  validates :status, inclusion: { in: ["new", "in progress", "finished", "reclaimed"] }

  include PgSearch
  pg_search_scope :global_search,
    against: %i[number at_date description status garage_id],
    using: {
      tsearch: { prefix: true }
    }
end
