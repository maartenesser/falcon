class Claim < ApplicationRecord
  has_many :parts
  belongs_to :user

  validates :number, presence: true
  validates :at_date, presence: true
  validates :description, presence: true
end
