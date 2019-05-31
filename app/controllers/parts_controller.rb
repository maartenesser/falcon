class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update]

  def show
    user_id = @part.user_id
    @user = User.find(user_id)
    claim_id = @part.claim_id
    @claim = Claim.find(claim_id)
    car_id = @part.car_id
    @car = Car.find(car_id)
  end

  def index
    @parts = policy_scope(Part).order(created_at: :desc)
  end

  def new
    @part = Part.new
    authorize @part
  end

  def update
    if @part.update(part_params)
      redirect_to part_path(@part)
    else
      render :edit
    end
  end

  def edit; end

  def create
    @part = Part.new(part_params)
    @part.user = current_user
    authorize @part
    if @part.save!
      redirect_to root_path, notice: 'Part succesfully created'

    else
      render :new

    end
  end

  private

  def part_params
    params.require(:part).permit(:part_model_code, :title, :description, :category, :car_id, :order_id, :claim_id, :price, :photo)
  end

  def set_part
    @part = Part.find(params[:id])
    authorize @part
  end
end
