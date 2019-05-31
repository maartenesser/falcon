class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :parts
  has_many :orders
  has_many :claims
  has_many :parts_as_insurance, through: :claims, source: :parts
  has_many :parts_as_garage, through: :orders, source: :parts
  mount_uploader :photo, PhotoUploader
end
