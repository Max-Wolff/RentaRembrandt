class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  validates :title, presence: true
  validates :artist, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_artist,
    against: [ :title, :artist ],
    using: {
      tsearch: { prefix: true }
    }

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

end
