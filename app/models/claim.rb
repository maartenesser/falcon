class Claim < ApplicationRecord
  belongs_to :insurance
  has_many :parts
end
