class RecipeTagsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipe_tags = RecipeTag.all
  end

  def show
    @recipe_tag = RecipeTag.friendly.find(params[:id])
  end

  def new
    @recipe_tag = RecipeTag.new
  end

  def create
    @recipe_tag = RecipeTag.new(recipe_tag_params)
    authorize @recipe_tag

    if @recipe_tag.save
      redirect_to @recipe_tag, notice: 'Recipe tag was successfully created.'
    else
      render :new
    end
  end

  def edit
    @recipe_tag = RecipeTag.friendly.find(params[:id])
    authorize @recipe_tag
  end

  def update
    @recipe_tag = RecipeTag.friendly.find(params[:id])
    if @recipe_tag.update(recipe_tag_params)
      redirect_to @recipe_tag, notice: 'Recipe tag was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe_tag.destroy
    redirect_to recipe_tags_path, notice: 'Recipe tag was successfully destroyed.'
  end

  private

  def set_recipe_tag
    @recipe_tag = RecipeTag.friendly.find(params[:id])
  end

  def recipe_tag_params
    params.require(:recipe_tag).permit(:name)
  end

end