class NotificationService < ApplicationController

  def send_sms(message)
    client = Twilio::REST::Client.new(ENV['ACCOUNT_ID_TWILO'], ENV['AUTH_TWILO'])
    from = ENV['TWILO_NUMBER'] # Your Twilio number
    to = ENV['MY_PHONENUMBER'] # Your mobile phone number

    client.messages.create(
      from: from,
      to: to,
      body: message)
  end
end
