class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :output, :action)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
