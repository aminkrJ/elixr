class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product.includes(:ingredients, :product_photos, :recipes).order(created_at: :desc).all
  end

  def show
    @product = Product.includes(:recipes).friendly.find(params[:id])
  end
end
