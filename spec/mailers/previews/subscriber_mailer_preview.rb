# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  def welcome
    SubscriberMailer.welcome Subscriber.first
  end
end
