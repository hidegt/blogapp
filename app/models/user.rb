class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

has_many :blogs, dependent: :destroy
has_many :blog_comments, dependent: :destroy
has_many :likes, dependent: :destroy
#フォロー機能
has_many :relationships, dependent: :destroy
has_many :followings, through: :relationships, source: :follow
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
has_many :followers, through: :reverse_of_relationships, source: :user

attachment :profile_image

#フォローメソッド
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
  validates :name, presence: true, length: { minimum: 2, maximum: 10 }
end