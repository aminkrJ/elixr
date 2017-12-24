class CartMailer < ApplicationMailer
  def dispatch_invoice(cart_id, tenant_id)
    @tenant = Tenant.find tenant_id
    Apartment::Tenant.switch!(@tenant.domain) #TODO use a gem to switch to right tenant
    @cart = Cart.find cart_id
    if @cart.invoice.exists?
      uri = URI.parse @cart.invoice.url
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.get uri.path
      end
      attachments["Invocie-#{@cart.reference_number}-#{@cart.created_at.strftime("%F")}.pdf"] = response.body
    end

    mail(
      to: @cart.customer.email,
      subject: "Invoice ##{@cart.reference_number}",
      from: "Life Elixir <support@lifelixir.com.au>",
      bcc: "amin.krj@gmail.com")
  end
end
