class ArticlesController < PublicController
  def index
    @articles = Article.select("id, title, description, slug, created_at").order(created_at: :desc).all
  end

  def show
    @article = Article.find_by_slug(params[:id])
  end
end
