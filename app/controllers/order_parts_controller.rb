class OrderPartsController < ApplicationController
  def update
    @part = Part.find(params[:id])

    @order = current_user.orders.available.last || Order.create(user: current_user)
    authorize @part
  end
end
