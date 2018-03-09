class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = Product
      .includes({recipes: :recipe_category}, :ingredients, :product_category)
      .order("updated_at DESC")
      .where(primary: true)
      .limit(25)
  end

  def show
    @product = Product.includes(recipes: :recipe_category).friendly.find(params[:id])
  end
end
