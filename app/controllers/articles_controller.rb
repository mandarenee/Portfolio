class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = ArticlePolicy::Scope.new(current_user, Article).resolve
  end

  def show
    @article = Article.friendly.find(params[:id])
    redirect_to @article, status: :moved_permanently unless request.path == article_path(@article)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    authorize @article

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
      current_user.articles << @article
    else
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    @article = Article.friendly.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def publish
    @article = Article.find(article_params)
    @article.publish!
    redirect_to @article
  end

  def destroy
    @article = Article.find(article_params)
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully destroyed.'
  end

  private

  def set_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, (:published if current_user.role == "editor"))
  end
end
