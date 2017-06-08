class SitemapController < ApplicationController
  def index
    @pages = ['', 'welcome.html', 'about.html', 'contact.html', 'hire_me.html']
    @articles = Article.all
    @categories = Category.all
    @recipes = Recipe.all
    @recipe_tags = RecipeTag.all

    respond_to do |format|
      format.xml
    end
  end
end
