class OrderPartsController < ApplicationController
  def update
    @part = Part.find(params[:id])

    @order = current_user.orders.available.last || Order.create(user: current_user)
    @part.order = @order
    authorize @part
    if @part.save
      redirect_to order_path(@order)
    else
      render 'parts/show'
    end
  end
end
