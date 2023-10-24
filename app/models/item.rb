class Item < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_one :notification, as: :subject, dependent: :destroy

  #画像複数投稿
  has_many_attached :images
  #動画投稿機能
  has_one_attached :video



  #ソート機能
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :favorites_count, -> {order(favorites: :desc)}
  scope :star_count, -> {order(star: :desc)}

  validates :name, presence: true
  validates :introduction, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_images
    (images.attached?) ? images : 'no_image.jpg'
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end


  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end

end
