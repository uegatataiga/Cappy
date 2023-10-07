class UsersController < ApplicationController
  def show
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
  end
end
