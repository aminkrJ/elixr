class SubscriberMailer < ApplicationMailer
  def download_pdf(subscriber)
    @subscriber = subscriber
    @download_url = "https://docs.google.com/document/d/1YDTWRgbANSaqRk6nc0ab-dif9w2E-eu-115GN7bmcTg/edit?usp=sharing"
    mail(to: @subscriber.email, subject: "21 days mindful eating for smart people")
  end
end
