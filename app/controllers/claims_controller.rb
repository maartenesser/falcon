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
    if params[:query].present?
      @claims = @claims.global_search(params[:query])
    end
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
          claim_number: claim.number,
          company: User.find(part.user_id).company_name,
          title: part.title,
          price: Money.new(part.price_cents, "EUR").format,
          part_id: part.id,
          claim_id: claim.id
          # status: Order.find(part.oder_id)
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
