class Category < ActiveRecord::Base
  default_scope { order(name: :desc) }
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :recipes
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
