class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true  # Anyone can create a booking
  end

  def destroy?
    record.user == user || record.painting.user == user  # Only booking creator can delete it
  end
end
