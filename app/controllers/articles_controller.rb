class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    
    if @article.save
      redirect_to articles_path, notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
