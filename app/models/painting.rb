class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, presence: true
  validates :artist, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true
  has_one_attached :photo
end
