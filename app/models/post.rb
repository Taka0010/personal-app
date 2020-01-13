class Post < ApplicationRecord
  validates :message, :image, presence: true

  belongs_to :user
  has_may :comments
end
