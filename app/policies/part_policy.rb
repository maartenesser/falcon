class PartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
      # scope define to see all the parts except mine
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end
end
