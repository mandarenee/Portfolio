class Article < ActiveRecord::Base
  belongs_to :user #:author, class_name: "User"
  has_many :comments
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end
