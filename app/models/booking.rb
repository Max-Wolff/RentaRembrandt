require_relative '../validators/availability_validator'

class Booking < ApplicationRecord
  belongs_to :painting
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date
  validates_uniqueness_of :painting_id, scope: [:user_id]

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
 end
end
