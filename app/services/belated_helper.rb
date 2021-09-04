# frozen_string_literal: true

class BelatedHelper
  def self.client
    return @client if @client

    client = Belated::Client.instance
    client.start unless client.started?
    @client = client
  end

  def self.set_reminder(reminder)
    reminder = UserNotifierMailer.send_reminder_email(reminder)
                                 .deliver_later(wait_until: reminder.remind_at)
  end
end
