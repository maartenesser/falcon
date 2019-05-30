class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update]

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
  end

  def index
    @claims = policy_scope(Claim).order(created_at: :desc)
  end

  def update
    if @claim.update(claim_params)
      redirect_to claim_path(@claim)
    else
      render :edit
    end
  end

  def edit
  end

  def statistic
    @claims = Claim.all
    @statistics = current_user.claims.map do |claim|
      claim.parts.map do |part|
        {
          title: part.title,
          price_cents: part.price_cents,
          claim_number: claim.number
          seller_id: User.find(part.id).company_name
        }
      end
    end.flatten
    skip_authorization
  end


  private

  def set_claim
    @claim = Claim.find(params[:id])
    authorize @claim
  end

  def claim_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id)
  end
end
