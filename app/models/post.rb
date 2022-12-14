class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50, too_long: "%{count} characters is maximum allowed"}
  validates :body, presence: true

  belongs_to :user
end
