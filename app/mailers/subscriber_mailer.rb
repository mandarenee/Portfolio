class SubscriberMailer < ApplicationMailer
  default from: 'manda@mandakom.com'

  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Welcome to MandaKom.com')
  end
end
