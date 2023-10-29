class Notification < ApplicationRecord

  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum action_type: { commented_to_own_item: 0, favorited_to_own_item: 1, followed_me: 3}

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  UEST_USER_EMAIL = "guest@example.com"

  def guest_user?
     email == GUEST_USER_EMAIL
  end
end
