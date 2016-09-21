class SubscriberMailer < ApplicationMailer
  def download_pdf(subscriber)
    @subscriber = subscriber
    @download_url = ""
    mail(to: @subscriber.email, subject: "Start your new journey")
  end
end
