class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # To list a specific order
    # No before_action as only used once..
  end

  def new
    @order = Order.new
  end
end
