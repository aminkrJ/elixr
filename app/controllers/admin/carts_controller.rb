class Admin::CartsController < AdminController
  def invoice
    @cart = Cart.find params[:id]
  end
end
