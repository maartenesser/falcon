class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if !current_user.blank?
      if current_user.insurance == true
        # Insurance

        @categories = Part.group(:category)
        @labels = []
        @count = @categories.count

        claims = Claim.joins(:user)

        # @parts = parts.where('orders.status' => 'pending').where('orders.user_id' => current_user.id)
        @part_total = current_user.parts_as_insurance.count

        # Objective for now as default can be modify in the futur => 10.000€
        objective = 10000.0

        @my_parts_pending =

        my_parts_in_cents = current_user.parts_as_insurance.sum(:price_cents)
        @part_earning_total_insurance = Money.new(my_parts_in_cents, 'EUR')

        # let like this : (the % is tested and works)
        @actual_in_percent = my_parts_in_cents / objective


        else

        # Garage

        parts_bought = 0
        orders = current_user.orders
        orders.each do |order|
          parts_bought += order.part.price_cents
        end
        @my_parts_bought = Money.new(parts_bought, 'EUR')


        # @part_earning_total_garage = Money.new(current_user.parts_as_garage.sum(:price_cents), 'EUR')
        @my_parts_sell = Money.new(current_user.parts.sum(:price_cents), 'EUR')

        #@my_parts_bought = Money.new(parts_bought.sum(:price_cents), 'EUR')

        @part_total = Part.count
        @pending_orders = current_user.orders.where(status: "pending").count

      end
    end
  end
end
