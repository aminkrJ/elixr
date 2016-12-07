class Api::V1::ArticlesController < Api::V1::BaseController
  before_action :set_article, only: [:show]

  def index
    @articles = if params[:category]
      Article.where(category: params[:category]).select("id, title, description, slug, created_at").order(created_at: :desc).all
    else
      Article.select("id, title, description, slug, created_at").order(created_at: :desc).all
    end
  end

  def show
  end
  
  private

  def set_article
    @article = Article.find_by_slug(params[:id])
  end

  def article_params
    params.require(:article).permit(:id, :title, :description, :content, :category, :slug)
  end
end
