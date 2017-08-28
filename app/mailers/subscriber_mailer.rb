class SubscriberMailer < ApplicationMailer
  def welcome(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Hey")
  end
end
