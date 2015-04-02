class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nick_name ,presence: true, uniqueness: true
  has_many :articles, dependent: :destroy
  has_many :user_comment_like_ships, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
end
