class ProductsController < PublicController
  def index
    @products = Product.order(created_at: :desc).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
