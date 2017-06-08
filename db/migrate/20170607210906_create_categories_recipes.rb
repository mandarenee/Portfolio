class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table :categories_recipes, id: false do |t|
      t.integer :recipe_id
      t.integer :category_id
    end
  end
end
