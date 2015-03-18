class ArticlesController < ApplicationController
  before_action :authorize_article, only: [:edit, :update]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = policy_scope(Article)
  end

  def show
    @article = Article.friendly.find(params[:id])
    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
      current_user.articles << @article
    else
      render :new
    end
  end

  def edit
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
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def authorize_article
     authorize Article
    end

    def article_params
      params.require(:article).permit(:title, :body, (:published if current_user.role == "editor"))
    end
end

