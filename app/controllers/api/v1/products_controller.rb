class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product.order(created_at: :desc).all
  end

  def show
    @product = Product.friendly.find(params[:id])
  end
end
