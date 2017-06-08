class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).where(published: true)
    else
      @recipes = RecipePolicy::Scope.new(current_user, Recipe).resolve
    end
  end

  def show
    @recipe ||= Recipe.friendly.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
    @recipe_tags = RecipeTag.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
      current_user.recipes << @recipe
    else
      render :new
    end
  end

  def edit
    authorize @recipe
    @categories = Category.all
    @recipe_tags = RecipeTag.all
  end

  def update
    @recipe = Recipe.friendly.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def publish
    @recipe = Recipe.find(recipe_params)
    @recipe.publish!
    redirect_to @recipe
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :body, :image, (:published if current_user.role == "editor"), :category_ids => [], :recipe_tag_ids => [])
  end
end
