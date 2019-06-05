class ClaimsController < ApplicationController
  after_action :send_notification, only: [:create]
  before_action :set_claim, only: %i[show edit update]

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
      There is a new claim from #{company_name}, ready to be processed. Click on the link to see the details of the claim:
      http://www.falcon-parts.com/"
      # Uncomment the line beneeth to recieve sms message to phone when claim is created
      NotificationService.new().send_sms(message)
      redirect_to claim_path(@claim.id), notice: "Claim #{@claim.number} was successfully created and a message was sent to #{garage_first_name}"
    else
      render :new
    end
  end

  def show
    insurance_id = Claim.find(@claim.id).user_id
    garage_id = Claim.find(@claim.id).garage_id
    @garage = User.find(garage_id).company_name
    @insurance = User.find(insurance_id).company_name

    claim_id = @claim.id
    read_status = params[:garage_read]
    notification_id = params[:notification_id]

    # Status noptification for the insurance logic needed for garage_show
    if !read_status.nil?
      @notification = Notification.find(notification_id)
      @notification.garage_read = read_status
      @notification.save
    end
    # End

    # Show info for both sides (isurance and garage)
    if !Part.where(claim_id: claim_id).first.nil?
      @part = Part.where(claim_id: claim_id).first
      car_id = @part.car_id
      @car = Car.find(car_id)
    end
    # end

    # Show parts that are linked to the claim number. logic for insurecnce show
    if current_user.insurance?
      @all_parts_for_this_claim = Part.where(claim_id: claim_id)
    end
  end

  def index
    @claims = policy_scope(Claim).order(at_date: :desc)
    @claims_garage = Claim.where(garage_id: current_user.id)
    if params[:query].present?
      @claims = @claims.global_search(params[:query]).order(at_date: :desc)
      @claims_garage = @claims_garage.global_search(params[:query]).order(at_date: :desc)
    end

    if params[:status].present?
      @claims = @claims.where(status: params[:status])
      @claims_garage = @claims_garage.where(status: params[:status])
    end
  end

  def update
    if @claim.update(claim_params)
      if current_user.insurance == true
        @claim.user = current_user
      else
        if @claim.status == "finished"
          content = "Hi #{@insurance_company_name}, the status for claim #{@claim.number} has changed to 'finished!'"
          Notification.create(content: content, claim_id: @claim.id, user_id: @claim.user_id)
        end
        redirect_to claim_path(@claim.id), notice: "Claim was succesfully updated to #{@claim.status}"
      end
    else
      render :edit
    end
  end

  def edit
  end

  def table
    @claims = Claim.all
    @table = current_user.claims.map do |claim|
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

  def send_notification
    # something
    garage_first_name = User.find(@claim.garage_id).company_name
    content = "Hi #{garage_first_name},
    There is a new claim for you #{@claim.number}."
    Notification.create(content: content, claim_id: @claim.id, user_id: @claim.garage_id)
  end

  def set_claim
    @claim = Claim.find(params[:id])
    authorize @claim
  end

  def claim_params
    # Merging the garage_id to the claim form.
    if current_user.insurance == true
      form_params.merge(garage_id: form_params[:user_id])
    else
      form_params
    end
  end

  def form_params
    params.require(:claim).permit(:number, :at_date, :description, :user_id, :status)
  end
end
