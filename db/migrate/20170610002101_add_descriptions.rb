class AddDescriptions < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :text
    add_column :recipes, :recipeYield, :integer
    add_column :articles, :description, :text
  end
end
