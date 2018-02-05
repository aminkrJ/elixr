class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = if params[:product_category_id]
      product_category = ProductCategory.find params[:product_category_id]

      product_category
        .products
        .includes(:ingredients, :product_category)
        .order("id DESC")
        .limit(25)
        .all
    else
      Product.includes(:ingredients, :product_category).order("updated_at DESC").where(primary: true).limit(25).all
    end
  end

  def show
    @product = Product.includes(:recipes).friendly.find(params[:id])
  end
end
