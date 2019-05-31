class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if !current_user.blank?
      if current_user.insurance == true
        @part_total = Part.count
        @part_earning_total_insurance = Money.new(current_user.parts_as_insurance.sum(:price_cents), 'EUR')
      else
        parts_bought = []
        parts = current_user.orders.where(status: "pending")
        parts.each do |part|
          parts_bought << part
        end
          #@parts_bought_sum = Money.new(parts_bought.sum(:price_cents), 'EUR')
        # @part_earning_total_garage = Money.new(current_user.find().sum(:price_cents), 'EUR')
        @part_total = Part.count
        @pending_orders = current_user.orders.where(status: "pending").count
        # Order.joins(:Parts).where(articles: { author: author })
      end
    end
  end
end
