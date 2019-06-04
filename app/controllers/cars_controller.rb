class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update]

  def index
    @cars = policy_scope(Car)
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(form_params)
    authorize @car
    if @car.save
      redirect_to new_part_path
    else
      render :new
    end
  end

  def update
    if @car.update(form_params)
      redirect_to car_path(@car)
    else
      render :edit
    end
  end

  def edit; end

  private

  def set_car
    @car = Car.find(params[:id])
    authorize @car
  end

  def form_params
    params.require(:car).permit(:vin, :make, :model)
  end
end
