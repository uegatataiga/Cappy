class Notification < ApplicationRecord

  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_item: 0, favorited_to_own_item: 1, followed_me: 3}

end
