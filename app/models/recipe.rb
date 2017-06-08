class Recipe < ActiveRecord::Base
  has_attached_file :image, styles: { large: '900x900', thumb: '150x150' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :author, class_name: "User"
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :recipe_tags
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def self.search(query)
    where("body like ? or title like ?", "%#{query}%", "%#{query}%")
  end
end
