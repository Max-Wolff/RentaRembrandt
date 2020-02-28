class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :painting

  validates :user_id, uniqueness: { scope: :painting_id }
end
