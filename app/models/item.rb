class Item < ApplicationRecord
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
