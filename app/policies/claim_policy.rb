class ClaimPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      Claim.where(user: user)
    end
  end

  def create?
    current_user.insurance? == true
  end

  def new?
    current_user.insurance? == true
  end
end
