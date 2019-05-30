class OrdersController < ApplicationController
  def index # The index is the basket
    # @part = Part.find(params[:part_id])
    # @parts = Part.all
    # raise
    @orders = policy_scope(Order)
    authorize @orders
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def create
    @part = Part.find(params[:part_id])
    @order = Order.new(part: @part, user: current_user)
    authorize @order
    if @order.save
      redirect_to part_orders_path
    else
      render 'parts/show'
    end

    def update
      @part = Part.find(params[:part_id])
      @order = Order.new(part: @part, user: current_user)
      authorize @order
      if @order.save
        redirect_to part_orders_path
      else
        render 'parts/show'
      end
    end
  end
end
