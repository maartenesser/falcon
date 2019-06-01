class OrdersController < ApplicationController
  def index
    # The index is the basket
    @orders = policy_scope(Order)
    # @orders = policy_scope(Order.available)
    @orders = @orders.available # Tried and failed
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
      redirect_to orders_path
    else
      render 'parts/show'
    end
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.status = 'paid'
    if @order.save
      redirect_to order_path(@order)
    else
      render 'parts/show'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to orders_path
  end
end
