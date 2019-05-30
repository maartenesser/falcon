class Order < ApplicationRecord
  belongs_to :user
  belongs_to :part

  scope :available, -> { where(status: 'pending').where('created_at > ?', Time.zone.now - 1.hour) }
end
