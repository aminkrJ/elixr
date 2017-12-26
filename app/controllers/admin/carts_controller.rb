class Admin::CartsController < AdminController
  before_action :set_cart, only: [:destroy]

  def invoice
    @cart = Cart.find params[:id]
    @address = @cart.customer.addresses.first

    render "invoice", locals: {cart: @cart, address: @address}
  end

  def index
    @carts = Cart.includes(:customer).order('created_at DESC').all
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to admin_carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @article = Cart.find(params[:id])
    end
end
