class Blog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :blog_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
  validates :image, presence:true
end
