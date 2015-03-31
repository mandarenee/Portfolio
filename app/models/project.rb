class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255, too_short: ": That's too short!" }
  mount_uploader :image, ImageUploader
end
