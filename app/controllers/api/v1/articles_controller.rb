class Api::V1::ArticlesController < Api::V1::BaseController
  before_action :set_article, only: [:show]

  def index
    @articles = if params[:category]
      Article.published.where(category: params[:category]).order(updated_at: :desc).all
    else
      Article.published.order(updated_at: :desc).all
    end
  end

  def show
  end
  
  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:id, :title, :description, :content, :category, :slug)
  end
end
