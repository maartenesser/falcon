class Notification < ApplicationRecord
  belongs_to :claim
  belongs_to :user
end
