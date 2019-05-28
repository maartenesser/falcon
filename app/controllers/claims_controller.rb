class ClaimsController < ApplicationController
  def new
    @claim = Claim.new
    @user = User.find(params[:user_id])
    authorize @claim
  end

  def create
    @claim = Claim.new(claim_params)
    @user = current_user
    authorize @claim
    if @claim.save
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def claim_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id)
  end
end
