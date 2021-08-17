# frozen_string_literal: true

class UserNotifierMailer < ApplicationMailer
  default from: 'sampo@wasurechatta.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_reminder_email(user)
    @user = user
    mail(to: 'sampo@wasurechatta.com',
         subject: 'This is a reminder')
  end
end
