class CategoriesController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    @recipe_tags = @category.recipes.map{|recipe| recipe.recipe_tags.all }.flatten.uniq
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def edit
    @category = Category.friendly.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
