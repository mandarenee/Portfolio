class RecipeTag < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
