# frozen_string_literal: true

class GreetingsController < ApplicationController
  before_action :authenticate_user!, only: [:greet]
  def index
    @count = Counter.first&.count.to_i
    BelatedHelper.client.perform_belated(
      proc {
        count = Counter.find_or_initialize_by(id: 1)
        count.update(count: count.count.next)
      }
    )
  end

  def greet
    UserNotifierMailer.send_reminder_email(current_user).deliver_now
    redirect_to :root
  end
end
