class StaticPagesController < ApplicationController
  def welcome
    @articles = Article.all
  end

  def about
  end

  def contact
  end

  def show
  end
end
