class OrdersController < ApplicationController
  def index
    # The index is the basket
    @orders = policy_scope(Order)
    authorize @orders
    total_price = 0
    @basket_full = false
    current_user.orders.each do |order|
      if order.status == 'pending' && order.part != nil
        total_price += order.part.price_cents
        # checking if there is an item in the basket. if not don't show the buy button
        @basket_full = true
      end
    end
    @total_price_format = Money.new(total_price, "EUR").format
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
    @orders = current_user.orders
    @unsuccesfull_orders = []

    @orders.each do |order|
      authorize order
      order.status = 'paid'
      unless order.save
        @unsuccesfull_orders << order
      end
    end

    if @unsuccesfull_orders.length == 0
      redirect_to purchasedparts_path, notice: "You succesfully bought all your parts"
    else
      redirect_to orders_path, notice: "not all the parts have been bought"
    end
  end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy
    redirect_to orders_path
  end

  def history
    @orders = policy_scope(Order).where(status: 'paid')
    authorize @orders
      @table = @orders.map do |order|
        {
          id: order.id,
          title: order.part.title,
          created_at: order.created_at.strftime("%d/%m/%Y at %H:%M:%S"),
          price: Money.new(order.part.price_cents, "EUR").format,
          company: User.find(order.part.user_id).company_name,
          # date: order.created_at.strftime("%d/%m/%Y")
        }

    end.flatten
    skip_authorization

  end
end
