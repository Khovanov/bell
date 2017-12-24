class HomeController < ApplicationController
  def index
  end

  def call
    ip = request.ip
    notification = Notification.find_or_create_by(ip: ip)
    render(json: {error: "can not find or create notification"}.to_json ) and return unless notification.present?
    if notification.update(count: notification.count += 1)
      render json: notification
    else
      render json: {errors: notification.errors.messages}.to_json
    end
  end
end
