class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :edit, :update]

  def new
    @claim = Claim.new
    @user = current_user.id
    authorize @claim
  end

  def create
    @claim = Claim.new(claim_params)
    @claim.user = current_user
    authorize @claim
    if @claim.save
      company_name = current_user.company_name
      garage_first_name = User.find(@claim.garage_id).company_name
      # add the ohone number of the reciever.
      message = "Hello #{garage_first_name},
      There is a new claim from #{company_name}, ready to be procesed click on the link to see the details of the claim:
      http://www.falcon-parts.com/"
      # Uncomment the line beneeth to recieve sms message to phone when claim is created
      # NotificationService.new().send_sms(message)
      redirect_to claim_path(@claim.id)
    else
      render :new
    end
  end

  def show
    claim_id = @claim.id
    if !Part.where(claim_id: claim_id).first.nil?
      @part = Part.where(claim_id: claim_id).first
      car_id = @part.car_id
      @car = Car.find(car_id)
    end
  end

  def index
    @claims = policy_scope(Claim).order(at_date: :desc)
    @claims_garage = Claim.where(user_id: current_user.id)

    if params[:query].present?
      @claims = @claims.global_search(params[:query]).order(at_date: :desc)
    end
  end

  def update
    if @claim.update(claim_params)
      @claim.user = current_user
      redirect_to claim_path(@claim.id)
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

  def destroy
    @claim = Claim.find(params[:id])
    authorize @claim
    @claim.destroy
    redirect_to claims_path
  end

  private

  def set_claim
    @claim = Claim.find(params[:id])
    authorize @claim
  end

  def claim_params
    # Merging the garage_id to the claim form.
    form_params.merge(garage_id: form_params[:user_id])
  end

  def form_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id, :status)
  end
end
