class OrdersController < ApplicationController
  def show
    # To list a specific order
    @order = Order.find(params[:id])
    authorize @order
  end
end
