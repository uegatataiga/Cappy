class SessionsController < Devise::SessionsController

  def guest_sign_in #ゲストユーザーの記述
    user = User.guest
    sign_in user
    redirect_to users_mypage_path, notice: "ゲストユーザーでログインしました。"
  end

end