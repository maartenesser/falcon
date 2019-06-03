class StatisticsController < ApplicationController
  skip_after_action :verify_authorized, except: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if !current_user.blank?
      if current_user.insurance == true
        # @part_total = current_user.parts_as_insurance.count
        set_objectif_insurance
        set_bought_and_pending
        donut_category
        evolution_sell_insurance
      else
        @part_total = Part.joins(:order)
                          .where('orders.status' => 'pending')
                          .count
        @my_parts_sell = Money.new(current_user.parts.sum(:price_cents), 'EUR')
        @pending_orders = current_user.orders.where(status: "pending").count
        set_objectif_garage
        donut_category
        evolution_sell_garage

      end
    end
  end

  private

  def set_objectif_insurance
    objective = 10000.0 #in EUR
    my_parts_in_cents = current_user.parts_as_insurance.sum(:price_cents)
    @part_earning_total_insurance = Money.new(my_parts_in_cents, 'EUR')
    @actual_in_percent = my_parts_in_cents / objective
  end

  def set_objectif_garage
    objective_garage = 1000.0
    parts_bought = 0
    orders = current_user.orders
    orders.each do |order|
      parts_bought += order.part.price_cents
    end
    @my_parts_bought = Money.new(parts_bought, 'EUR')
    @actual_in_percent = parts_bought / objective_garage
  end

  def set_bought_and_pending
    @my_parts = Claim.where(user: current_user).pluck(:id)
    @all_parts_bought = Part.joins(:order)
                            .where('orders.status' => 'paid')
                            .where(claim_id: @my_parts)
                            .count
    @all_parts_pending = Part.joins(:order)
                             .where('orders.status' => 'pending')
                             .where(claim_id: @my_parts)
                             .count
  end

  def donut_category
    @categories = Part.joins(:order).where('orders.status' => 'pending').group(:category)
    @labels = []
    @count = @categories.count
  end

  def evolution_sell_insurance
    my_parts = Claim.where('claims.user_id' => current_user.id).pluck(:id)
    @count_all = []
    12.times do |i|
      from_date = Date.new(Time.zone.now.year, i + 1, 1).to_datetime
      to_date = from_date + 1.month
      @count_all << Part.joins(:order)
                            .where('orders.status' => 'paid')
                            .where(claim_id: my_parts)
                            .where(created_at: from_date..to_date).count
    end
    @count_all
  end

  def evolution_sell_garage
    # @count_sum = current_user.parts.joins(:order).where('orders.status' => 'paid').count

    @count_all = []
    12.times do |i|
      from_date = Date.new(Time.zone.now.year, i + 1, 1).to_datetime
      to_date = from_date + 1.month
      @count_all << current_user.parts
                                .joins(:order)
                                .where('orders.status' => 'paid')
                                .where(created_at: from_date..to_date).count
    end
    @count_all
  end
end