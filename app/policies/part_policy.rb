class PartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
      # scope define to see all the parts except mine
      # can we scope with status as well..
    end
  end

  def my_bought_parts?
    true
  end

  def my_selling_parts?
    true
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
