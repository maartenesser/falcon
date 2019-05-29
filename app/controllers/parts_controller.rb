class PartsController < ApplicationController
  # before_action :set_part, only: [:new, :edit, :update]

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
    @part = Part.new(part_params)
    @part.user = current_user
    authorize @part
    if @part.save!
      redirect_to root_path, notice: 'Part succesfully created'

    else
      render :new

    end
  end

  private

  def part_params
    params.require(:part).permit(:part_model_code, :title, :description, :category, :car_id, :order_id, :claim_id)
  end

  def set_part
    @part = Part.find(params[:id])
    authorize @part
  end
end
