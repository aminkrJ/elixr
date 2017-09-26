class CampaignMailer < ApplicationMailer
  def send_pdf(campaign, subscriber)
    if campaign.pdf.exists?
      uri = URI.parse campaign.pdf.url
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.get uri.path
      end
      attachments["#{campaign.pdf_title.parameterize}.pdf"] = response.body
    end

    mail(
      to: subscriber.email,
      subject: "#{campaign.pdf_title}",
      from: "#{Tenant.current.app_name} <#{Tenant.current.smtp_username}>",
      bcc: "amin.krj@gmail.com")
  end
end
