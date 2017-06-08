class CreateRecipeTagsRecipes < ActiveRecord::Migration
  def change
    create_table :recipe_tags_recipes, id: false do |t|
      t.integer :recipe_id
      t.integer :recipe_tag_id
    end
  end
end
