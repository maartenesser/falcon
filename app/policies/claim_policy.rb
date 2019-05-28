class ClaimPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      Claim.where(user: user)
    end
  end

  def create?
    user.insurance? == true
  end

  def new?
    user.insurance? == true
  end

  def show?
    user.insurance? == true
  end
end
