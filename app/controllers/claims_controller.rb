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
      redirect_to claim_path(@claim.id)
    else
      render :new
    end
  end

  def show
    @claim = Claim.find(params[:id])
    authorize @claim
  end

  private

  def claim_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id)
  end
end
