class OrdersController < ApplicationController
  def index
    # The index is the basket
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
      # Send email to buyer
      mail = OrderMailer.with(order: @order).order_confirmation
      mail.deliver_now
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

  def history
    @orders = policy_scope(Order)
    authorize @orders
    i = 0
      @table = current_user.claims.map do |claim|
      claim.parts.map do |part|
        {
          claim_number: i = i + 1,
          company: User.find(part.user_id).company_name,
          title: part.title,
          price: Money.new(part.price_cents, "EUR").format,
          part_id: part.id,
          claim_id: claim.id
          # status: Order.find(part.oder_id)
        }
      end
    end.flatten
    skip_authorization

  end
end
