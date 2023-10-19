class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    @items = @user.items
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
  end

  def mypage
    @user = current_user
    @following_users = @user.following_users
    @follower_users = @user.follower_users
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
    @favorite_items = Kaminari.paginate_array(@favorite_items).page(params[:page]).per(8)
    @items = @user.items
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(8)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "更新に成功しました。"
    redirect_to user_path(@user.id)
    else
    @users = User.all
    render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.following_users.per(8)
  end

  def followers
    user = User.find(params[:id])
    @user = user.follower_users.page(params[:page]).per(8)
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:item_id)
    @favorite_items = Item.find(favorites)
    @favorite_items = Kaminari.paginate_array(@favorite_items).page(params[:page]).per(8)
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