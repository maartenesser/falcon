class Order < ApplicationRecord
  belongs_to :user
  has_many :parts

  scope :available, -> { where(status: 'pending').where('created_at > ?', Time.zone.now - 1.hour) }

end
