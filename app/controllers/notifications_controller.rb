class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification).order(created_at: :desc)
  end

  def show; end

  def create
    @notification = Notification.new(notification_params)
    authorize @notification
    if @notification.save
      redirect_to root_path, notice: 'Garage has been notified'
    end
  end

  def update; end

  private

  def notification_params
    params.require(:notification).permit(:content, :user_id, :claim_id)
  end
end
