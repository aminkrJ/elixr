class ArticlesController < PublicController
  def index
    @articles = Article.all
  end
end
