class CommentsController < ApplicationController
  before_action :authorize_comment, only: [:edit, :update]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @article = Article.friendly.find(params[:article_id])
    @comments = @article.comments
  end

  def show
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def new
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.build
    @comment.commenter_name = current_user.name
  end

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.commenter_name = current_user.name
    if @comment.save
      redirect_to article_comment_path(@article, @comment)
    else
      render :new
    end
  end

  def edit
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.friendly.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to article_comment_path(@article, @comment)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_comments_path(@article)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment
    authorize Comment
  end

  def comment_params
    params.require(:comment).permit(:commenter_name, :content, (:approved if current_user.role == "editor"))
  end
end
