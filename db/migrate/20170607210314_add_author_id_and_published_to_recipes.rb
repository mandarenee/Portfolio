class AddAuthorIdAndPublishedToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :author_id, :integer
    add_column :recipes, :published, :boolean
    add_index :recipes, :slug
  end
end
