class StatisticsController < ApplicationController
  skip_after_action :verify_authorized, except: :index
  skip_after_action :verify_policy_scoped, only: :index

  def index
    if !current_user.blank?
      if current_user.insurance == true
        set_objectif_insurance
        set_total_amount_of_part
        donut_category
        evolution_sell_insurance
        set_bought_and_pending_parts_from_claims
      else
        set_total_amount_of_part
        @my_parts_sell = Money.new(current_user.parts.sum(:price_cents), 'EUR')
        @pending_orders = current_user.orders.where(status: "pending").count
        set_objectif_garage
        donut_category
        evolution_buy_garage

      end
    end
  end

  private

  def set_total_amount_of_part
    @part_total = Part.left_outer_joins(:order)
                      .where.not(user: current_user, orders: { user: current_user })
                      .where(orders: { status: "pending" })
                      .or(Part.left_outer_joins(:order)
                      .where.not(user: current_user)
                      .where(orders: { id: nil })).count
  end

  def set_objectif_insurance
    objective = 15000.0 #in EUR
    my_parts_in_cents = current_user.parts_as_insurance.sum(:price_cents)
    @part_earning_total_insurance = Money.new(my_parts_in_cents, 'EUR')
    @actual_in_percent = my_parts_in_cents / objective
  end

  def set_objectif_garage
    objective_garage = 2500.0
    parts_bought = 0
    orders = current_user.orders
    orders.each do |order|
      parts_bought += order.part.price_cents
    end
    @my_parts_bought = Money.new(parts_bought, 'EUR')
    @actual_in_percent = parts_bought / objective_garage
  end

  def set_bought_and_pending_parts_from_claims
    @my_parts = Claim.where(user: current_user).pluck(:id)
    @all_parts_bought = Part.joins(:order)
                            .where('orders.status' => 'paid')
                            .where(claim_id: @my_parts)
                            .count
    @all_parts_pending = Part.joins(:order)
                             .where('orders.status' => 'pending')
                             .where(claim_id: @my_parts)
                             .count
    @all_claims_finish = current_user.claims.where(status: "finished").count

  end

  def donut_category
    @categories = Part.left_outer_joins(:order)
                      .where.not(user: current_user, orders: { user: current_user })
                      .where(orders: { status: "pending" })
                      .or(Part.left_outer_joins(:order)
                      .where.not(user: current_user)
                      .where(orders: { id: nil })).group(:category)
    @labels = []
    @count = @categories.count
  end

  def evolution_sell_insurance
    my_claims = Claim.where('claims.user_id' => current_user.id).pluck(:id)
    @count_all = []
    12.times do |i|
      from_date = Date.new(Time.zone.now.year, i + 1, 1).to_datetime
      to_date = from_date + 1.month
      @count_all << Part.joins(:order)
                            .where('orders.status' => 'paid')
                            .where(claim_id: my_claims)
                            .where(created_at: from_date..to_date).count
    end
    @count_all
  end

  def evolution_buy_garage
    # @count_sum = current_user.parts.joins(:order).where('orders.status' => 'paid').count
    # @count_sum = current_user.orders.where(status: 'paid').count

    @count_all = []
    12.times do |i|
      from_date = Date.new(Time.zone.now.year, i + 1, 1).to_datetime
      to_date = from_date + 1.month
      @count_all << current_user.orders
                                .where(status: 'paid')
                                .where(created_at: from_date..to_date).count
    end
    @count_all
  end
end
