class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: [:null_user, :author, :editor]
  after_initialize :set_default_role, :if => :new_record?
  has_many :articles, foreign_key: "author_id"

  def set_default_role
    self.role ||= :null_user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
