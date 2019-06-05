class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update]

  def show
    # The logic below will have to be implemented and we will have to raise
    # an error if a user tries to access his part like that
    # But the selling parts controller will have to be checked first
    # part = Part.where.not(user: current_user)
    # @part = part.find(params[:id])

    user_id = @part.user_id
    @user = User.find(user_id)
    claim_id = @part.claim_id
    @claim = Claim.find(claim_id)
    policy_scope(Part)
    car_id = @part.car_id
    @car = Car.find(car_id)
    # raise
  end

  def index
    @parts = policy_scope(Part).order(created_at: :desc)
    if params[:query].present?
      @parts = Part.global_search(params[:query])
    end
  end

  def new
    @part = Part.new
    authorize @part
  end

  def update
    # if !@part.order.nil? && @part.order.user_id == current_user.id
    #   notice: 'You cannot buy the same part twice'
    #   redirect_to root_path
    # end

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
    if @part.save
      redirect_to root_path, notice: 'Part successfully created'
    else
      render :new

    end
  end

  def destroy
    # @part.destroy
    part = Part.find(@part)
    part.destroy
    redirect_to parts_path
  end

  def my_bought_parts
    # @parts = policy_scope(Part).order(created_at: :desc)
    # @parts = Part.all
    # @parts_pending = Part.joins(:oder).where(status: "pending")
    # @order1= Part.where(Part.order.status = "pending")
    # orders = Order.where(user_id: current_user)

    parts = Part.joins(:order)
    @parts = parts.where('orders.status' => 'paid').where('orders.user_id' => current_user.id)
    authorize @parts
  end

  def my_selling_parts
    # @parts = policy_scope(Part).order(created_at: :desc)
    # @parts = Part.all
    # @parts_pending = Part.joins(:oder).where(status: "pending")
    # @order1= Part.where(Part.order.status = "pending")
    # orders = Order.where(user_id: current_user)

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
