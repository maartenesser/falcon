class ClaimPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      Claim.where(user: user)
    end
  end

  def create?
    true
  end

  def new?
    true
  end
end
