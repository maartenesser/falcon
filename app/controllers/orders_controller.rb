class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # To list a specific order
  end

  def new
    @order = Order.new
  end
end
