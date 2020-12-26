class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  #投稿者でないユーザーがアクセスしたときにTOPページに遷移
  before_action :restriction, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all.order('created_at DESC')
    @article = @articles.find_by(params[:id])
    @users = User.all
    @tags = Tag.all
  end

  def new
    @article_tag = ArticleTag.new
  end

  def create
    @article_tag = ArticleTag.new(article_params)
    tag_list = params[:article][:tag_name].split(',')
    if @article_tag.valid?
      @article_tag.save(tag_list)
      redirect_to articles_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    @article_tag = ArticleTag.new(article: @article)
  end

  def update
    @article_tag = ArticleTag.new(article_params, article: @article)
    tag_list = params[:article][:tag_name].split(',')
    if @article_tag.valid?
      @article_tag.save(tag_list)
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @article.destroy
  end

  def search
    if params[:word].present?
      @articles = Article.search(params[:word]).order('created_at DESC')
    else
      redirect_to articles_path
    end
  end

  def tag_search
    @tag = Tag.find(params[:id])
    @articles = @tag.articles.order('created_at DESC')
  end

  private

  # formオブジェクトから保存する値は全てpermitで指定する
  def article_params
    params.require(:article).permit(
      :title, :output, :action, :user_id, :article_id, :tag_name, :tag_id
    ).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def restriction
    redirect_to root_path if current_user.id != @article.user_id.to_i
  end

end
