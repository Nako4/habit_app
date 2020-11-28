class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit]
  # before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article_tag = ArticleTag.new
  end

  def create
    @article_tag = ArticleTag.new(article_params)
    if @article_tag.valid?
      @article_tag.save(current_user)
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

  # formオブジェクトから保存する値は全てpermitで指定する
  def article_params
    params.require(:article_tag).permit(
      :title, :output, :action, :user_id, :article_id, :tag_name, :tag_id
    ).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
