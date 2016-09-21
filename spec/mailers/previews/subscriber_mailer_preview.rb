# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  def download_pdf
    SubscriberMailer.download_pdf Subscriber.first
  end
end
