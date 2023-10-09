class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  #画像複数投稿
  has_many_attached :images
  #動画投稿機能
  has_one_attached :video

  validates :name, presence: true
  validates :introduction, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
