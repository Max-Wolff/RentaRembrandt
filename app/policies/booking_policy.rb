class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a bookinng
  end

  def create?
    true  # Anyone can create a booking
  end

  def update?
    record.user == user  # Only booking creator can update it
  end

  def destroy?
    record.user == user  # Only booking creator can delete it
  end
end
