class Api::V1::ProductCategoriesController < Api::V1::BaseController
  def index
    @categories = ProductCategory.all
  end
end
