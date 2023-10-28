class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :comment, presence: true
  # 通知機能
  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications

  private
  def create_notifications
    Notification.create(subject: self, user: item.user, action_type: :commented_to_own_item)
  end
end
