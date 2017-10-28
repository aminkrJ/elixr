class CampaignMailer < ApplicationMailer
  attr_accessor :delivery_options

  def send_pdf(campaign_id, subscriber_id, tenant_id)
    @tenant = Tenant.find tenant_id
    Apartment::Tenant.switch!(@Tenant.domain) #TODO use a gem to switch to right tenant

    @campaign = Campaign.find campaign_id
    @subscriber = Subscriber.find subscriber_id

    if @campaign.pdf.exists?
      uri = URI.parse @campaign.pdf.url
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.get uri.path
      end
      attachments["#{@campaign.pdf_title.parameterize}.pdf"] = response.body
    end

    mail(
      to: @subscriber.email,
      subject: "#{@campaign.short_description}",
      from: "#{@tenant.app_name} <#{@tenant.smtp_username}>",
      delivery_method_options: delivery_options,
      bcc: "amin.krj@gmail.com")
  end

  private

  def delivery_options
    @delivery_options ||= {
      user_name: @tenant.smtp_username,
      password: @tenant.smtp_password,
      address: "smtp.gmail.com",
      port: 587,
      authentication: "plain",
      enable_starttls_auto: true
    }
  end
end
