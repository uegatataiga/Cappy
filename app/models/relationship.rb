class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  # 通知機能
  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  GUEST_USER_EMAIL = "guest@example.com"

  def guest_user?
     email == GUEST_USER_EMAIL
  end


  private
  def create_notifications
    Notification.create(subject: self, user: followed, action_type: :followed_me)
  end
end
