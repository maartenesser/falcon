class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if !current_user.blank?
      if current_user.insurance == true
        @part_total = Part.count
        @part_earning_total_insurance = Money.new(current_user.parts_as_insurance.sum(:price_cents), 'EUR')
      else
        # @part_earning_total_garage = Money.new(current_user.parts_as_garage.sum(:price_cents), 'EUR')
        @part_total = Part.count
        # @pending_orders = Order.select.sum(status: "pending")

        # Order.where(user: user)
        # Order.joins(:Parts).where(articles: { author: author })
      end
    end
  end
end
