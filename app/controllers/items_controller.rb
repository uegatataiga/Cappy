class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @comment = Comment.new
  end

  def index
    @item = Item.all
    @user = current_user
  end

  def edit
  end
end
