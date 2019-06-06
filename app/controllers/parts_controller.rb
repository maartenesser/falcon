class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update]

  def index
    @parts = policy_scope(Part).order(created_at: :desc)
    if params[:query].present?
      # If it fails let's go back to the initial method below implemented by Nath :)
      # @parts = (Part.where.not(user: current_user).global_search(params[:query]))
      @parts = (Part.left_outer_joins(:order).where.not(user: current_user).where(orders: { id: nil })).where.not(user: current_user).global_search(params[:query])
    end
  end

  def show
    user_id = @part.user_id
    @user = User.find(user_id)

    claim_id = @part.claim_id
    @claim = Claim.find(claim_id)

    car_id = @part.car_id
    @car = Car.find(car_id)
  end

  def new
    @part = Part.new
    authorize @part
  end

  def create
    @part = Part.new(part_params)
    @part.user = current_user
    authorize @part
    if @part.save
      redirect_to my_selling_parts_path, notice: 'Part successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @part.update(part_params)
      redirect_to part_path(@part)
    else
      render :edit
    end
  end

  def destroy
    part = Part.find(@part)
    part.destroy
    redirect_to parts_path
  end

  def my_bought_parts
    parts = Part.joins(:order)
    @parts = parts.where('orders.status' => 'paid').where('orders.user_id' => current_user.id)
    authorize @parts
  end

  def my_selling_parts
    @parts = Part.left_outer_joins(:order)
                  .where(user: current_user, orders: { user: current_user })
                  .where(orders: { status: "pending" })
                  .or(Part.left_outer_joins(:order)
                  .where(user: current_user)
                  .where(orders: { id: nil }))
    authorize @parts
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
