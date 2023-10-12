module NotificationsHelper

  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_item
      item_path(notification.subject.item, anchor: "comment-#{notification.subject.id}")
    when :favorited_to_own_post
      item_path(notification.subject.item)
    when :followed_me
      user_path(notification.subject.follower)
    end
  end

end
