class Part < ApplicationRecord
  belongs_to :car
  belongs_to :user
  belongs_to :claim
  belongs_to :order, optional: true
end
