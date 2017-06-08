class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
  end
end
