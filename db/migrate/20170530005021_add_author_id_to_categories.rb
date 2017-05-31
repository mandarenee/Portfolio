class AddAuthorIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :author_id, :integer
  end
end
