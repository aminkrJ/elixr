class CartMailer < ApplicationMailer
  def dispatch_invoice(cart)
    @cart = cart
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
