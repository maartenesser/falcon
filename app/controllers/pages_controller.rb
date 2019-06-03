class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if !current_user.blank?
      if current_user.insurance == true

        # Insurance

        # for the donut graph :
        donut_category

        # @parts = parts.where('orders.status' => 'pending').where('orders.user_id' => current_user.id)
        @part_total = current_user.parts_as_insurance.count

        # Objective for now as default can be modify in the futur => 10.000€

        my_parts = Claim.where('claims.user_id' => current_user.id).pluck(:id)
        @all_parts_bought = Part.joins(:order).where('orders.status' => 'paid').where(claim_id: my_parts).count
        @all_parts_pending = Part.joins(:order).where('orders.status' => 'pending').where(claim_id: my_parts).count


        objective = 10000.0
        my_parts_in_cents = current_user.parts_as_insurance.sum(:price_cents)
        @part_earning_total_insurance = Money.new(my_parts_in_cents, 'EUR')

        # let like this : (the % is tested and works)
        @actual_in_percent = my_parts_in_cents / objective


        else

        # Garage

        # for the donut graph :
        donut_category

        # for the evolution graph
        evolution_sell

        # for the sum : buying part and % for the graph
        objective_garage = 1000.0
        parts_bought = 0
        orders = current_user.orders
        orders.each do |order|
          parts_bought += order.part.price_cents
        end
        @my_parts_bought = Money.new(parts_bought, 'EUR')
        @actual_in_percent = parts_bought / objective_garage

        # sum of my selling part
        @my_parts_sell = Money.new(current_user.parts.sum(:price_cents), 'EUR')

        # number of parts available online
        @part_total = Part.joins(:order).where('orders.status' => 'pending').count

        # number of my parts in pending order
        @pending_orders = current_user.orders.where(status: "pending").count

      end
    end
  end

  private

  def donut_category
    @categories = Part.joins(:order).where('orders.status' => 'pending').group(:category)
    @labels = []
    @count = @categories.count
  end

  def evolution_sell
    @count_all = current_user.parts.joins(:order).where('orders.status' => 'paid').count

    # start_date = params[:start_date].to_date.beginning_of_day
    # end_date = params[:end_date].to_date.end_of_day
    # records = Campaign.where(:created_at => start_date..end_date)

    @count_january = current_user.parts.joins(:order).where('orders.status' => 'paid').where(:created_at=>1.days.ago..Time.now)

  end
end
