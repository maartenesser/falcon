class ClaimsController < ApplicationController
  def new
    @claim = Claim.new
    @user = current_user.id
    authorize @claim
  end

  def create
    @claim = Claim.new(claim_params)
    authorize @claim
    if @claim.save
      redirect_to home_path
    else
      render :new
    end
  end

  def show

  end

  private

  def claim_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id)
  end
end
