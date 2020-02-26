class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  validates :title, presence: true
  validates :artist, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
