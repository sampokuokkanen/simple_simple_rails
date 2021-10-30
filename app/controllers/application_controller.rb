# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :fetch_time_zone

  def fetch_time_zone
    session[:time_zone]
  end
  
  def time_zone
    time_zone = request.body.read
    return unless time_zone.present?

    session[:time_zone] = time_zone
    if current_user.time_zone != time_zone
      current_user.update(time_zone: ActiveSupport::TimeZone::MAPPING.key(time_zone))
    end
  end
end
