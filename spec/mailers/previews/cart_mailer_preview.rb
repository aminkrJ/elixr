# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
  def dispatch_invoice
    CartMailer.dispatch_invoice Cart.first
  end
end
