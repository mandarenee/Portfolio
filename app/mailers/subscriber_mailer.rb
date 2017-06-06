class SubscriberMailer < ApplicationMailer

  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Welcome to MandaKom.com', from: ENV["DEFAULT_FROM"])
  end
end
