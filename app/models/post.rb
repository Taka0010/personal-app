class Post < ApplicationRecord
  validates :message, :image, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :post_tags
  has_many :tags, through: :post_tags

  #投稿が「いいね」されたかをチェック
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
