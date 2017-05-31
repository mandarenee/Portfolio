class Article < ActiveRecord::Base
  has_attached_file :image,
                    styles: {large: '900x900', thumb: '150x150'},
                    default_url: "/images/:style/missing.png",
                    s3_credentials: Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  default_scope { order(updated_at: :desc) }
  belongs_to :author, class_name: "User"
  has_many :comments, -> { order(created_at: :desc) }
  has_and_belongs_to_many :categories
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def s3_credentials
    {bucket: ENV["AWS_S3_BUCKET"], access_key_id: ENV["AWS_ACCESS_KEY_ID"], secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"], s3_host_name: 's3-us-west-2.amazonaws.com' }
  end
end
