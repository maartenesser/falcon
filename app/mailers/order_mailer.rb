class OrderMailer < ApplicationMailer
  def order_confirmation
    @order = params[:order]

      # to: User.find(@order.user_id).email,
    mail(
      to:       @order.user.email,

      subject:  "Invoice - #{@order.id}"
    )
  end
end
