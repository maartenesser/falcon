class PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update]

  def show; end

  def new
    @part = Part.new
    authorize @part
  end

  def update
    if @part.update(part_params)
      redirect_to part_path(@part)
    else
      render :edit
    end
  end

  def edit; end

  def create
    @part = Part.new(part.params)
    authorize @part
    if @part.save
      redirect_to part_path(@part), notice: 'Part succesfully created'
    else
      render :edit
    end
  end

  private

  def part_params
    params.require(:part).permit(:claim_id, :part_model_code, :car_id, :title, :description, :category, :photo_url, :user_id, :order_id, :price_cent)
  end

  def set_part
    @part = Part.find(params[:id])
    authorize @part
  end
end
