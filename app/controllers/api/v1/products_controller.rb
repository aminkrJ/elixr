class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product.includes(:ingredients, :product_photos, :recipes).order(created_at: :desc).all
  end

  def menu
    @products = Product.includes(:ingredients, :product_photos, :recipes).where(primary: false).order(created_at: :desc).all
    render :index
  end

  def bundles
    @products = Product.includes(:ingredients, :product_photos, :recipes).where(primary: true).order(created_at: :desc).all
    render :index
  end

  def show
    @product = Product.includes(:recipes).friendly.find(params[:id])
  end
end
