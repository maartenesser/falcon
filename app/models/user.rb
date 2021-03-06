class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notifications
  has_many :parts
  has_many :orders
  has_many :claims
  has_many :parts_as_insurance, through: :claims, source: :parts
  # has_many :parts_as_garage, through: :parts, source: :orders
  mount_uploader :photo, PhotoUploader
end
