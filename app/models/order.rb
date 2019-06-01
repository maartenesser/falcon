class Order < ApplicationRecord
  belongs_to :user
  belongs_to :part

  # scope :available, -> { (where("`status` =?", 'pending')) }
end
