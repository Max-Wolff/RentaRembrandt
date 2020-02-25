class PaintingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a painting
  end

  def create?
    true  # Anyone can create a painting
  end

  def update?
    record.user == user  # Only painting creator can update it
  end

  def destroy?
    record.user == user  # Only painting creator can delete it
  end

  private

  # for later including admin logic

  # def is_owner_or_admin?
  #   user == record.user || user.admin
  # end
end
