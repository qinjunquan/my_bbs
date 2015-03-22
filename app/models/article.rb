class Article < ActiveRecord::Base
  paginates_per 25
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :content , presence: true
  has_many :comments
end
