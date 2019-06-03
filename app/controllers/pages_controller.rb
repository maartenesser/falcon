class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if !current_user.blank?
      if current_user.insurance == true
        # Insurance
        @categories = Part.group(:category)
        @labels = []
        @count = @categories.count

        @part_total = Part.count
        @part_earning_total_insurance = Money.new(current_user.parts_as_insurance.sum(:price_cents), 'EUR')
      else

        # Garage

        parts_bought = 0
        orders = current_user.orders
        orders.each do |order|
          # can be removed buy when I created orders without parts it made the website crash
          if order.part != nil
            parts_bought += order.part.price_cents
          end
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
