class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    
    if @article.save
      redirect_to articles_path, notice: '投稿が完了しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article)
    end
  end


  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy!
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
