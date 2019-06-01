class ClaimPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user.insurance
  end

  def destroy?
    user.insurance
  end

  def new?
    user.insurance
  end

  def show?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def statistic?
    user.insurance
  end
end
