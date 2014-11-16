class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :comments

  validates :title, :body, :published_at, presence: true
end
