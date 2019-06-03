class PartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.left_outer_joins(:order).where.not(user: user, orders: { user: user }).where(orders: { status: "pending" }).or(Part.left_outer_joins(:order).where.not(user: user).where(orders: { id: nil }))
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
