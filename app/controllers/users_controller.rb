class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    @items = @user.items
  end

  def mypage
    @user = current_user
    @following_users = @user.following_users
    @follower_users = @user.follower_users
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
    redirect_to user_path(current_user.id)
    else
    @user = User.find(params[:id])
    end
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    unless @user.id == current_user.id
    redirect_to user_path(@user)
    end

    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users
  end

  def followers
    user = User.find(params[:id])
    @user = user.follower_users
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
  end

  def check
  end

  def is_withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_deleted)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end