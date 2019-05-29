class ClaimPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user.insurance
  end

  def new?
    user.insurance
  end

  def show?
    user.insurance
  end

  def update?
    user.insurance
  end

  def edit?
    user.insurance
  end
end
