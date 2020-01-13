class Post < ApplicationRecord
  validates :message, :image, presence: true

  belongs_to :user
  has_many :comments
end
