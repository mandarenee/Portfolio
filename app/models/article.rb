class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
end


