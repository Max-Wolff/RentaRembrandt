class Booking < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_uniqueness_of :painting_id, scope: [:user_id]
end
