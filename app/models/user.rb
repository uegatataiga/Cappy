class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followeds, source: :follower
  has_many_attached :profile_image

  validates :name, presence: true

  #フォロー機能
 def follow(user_id)
   followers.create(followed_id: user_id)
 end


 def unfollow(user_id)
   followers.find_by(followed_id: user_id).destroy
 end


 def following?(user)
   following_users.include?(user)
 end

  #ユーザーステータス
 def user_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
 end

 def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
 end
end
