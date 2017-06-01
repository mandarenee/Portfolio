class Article < ActiveRecord::Base
  has_attached_file :image, styles: { large: '900x900', thumb: '150x150' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  default_scope { order(updated_at: :desc) }
  belongs_to :author, class_name: "User"
  has_many :comments, -> { order(created_at: :desc) }
  has_and_belongs_to_many :categories
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def self.search(query)
    where("body like ? or title like ?", "%#{query}%", "%#{query}%")
  end
end
