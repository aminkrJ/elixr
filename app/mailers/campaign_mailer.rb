class CampaignMailer < ApplicationMailer
  attr_accessor :delivery_options

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
      delivery_method_options: delivery_options,
      bcc: "amin.krj@gmail.com")
  end

  private

  def delivery_options
    @delivery_options ||= {
      user_name: Tenant.current.smtp_username,
      password: Tenant.current.smtp_password,
      address: "smtp.gmail.com",
      port: 587,
      authentication: "plain",
      enable_starttls_auto: true
    }
  end
end
