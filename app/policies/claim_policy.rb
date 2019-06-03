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
    # make sure to look at it again because auf security issue : a garage could edit a claim .....
    true
  end

  def edit?
    true
  end

  def table?
    user.insurance
  end
end
