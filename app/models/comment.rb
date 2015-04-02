class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  has_many :user_comment_like_ships, dependent: :destroy
  validates :content, presence: true
end
