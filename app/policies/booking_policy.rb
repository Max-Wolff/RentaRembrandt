class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user || record.painting.user == user  # Anyone can view a bookinng
  end

  def create?
    true  # Anyone can create a booking
  end

  def update?
    record.user == user || record.painting.user == user # Only booking creator can update it
  end

  def destroy?
    record.user == user || record.painting.user == user  # Only booking creator can delete it
  end
end
