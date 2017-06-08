class CreateRecipeTags < ActiveRecord::Migration
  def change
    create_table :recipe_tags do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
