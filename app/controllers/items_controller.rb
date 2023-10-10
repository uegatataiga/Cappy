class ItemsController < ApplicationController
     before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @comment = Comment.new
  end

  def index
    if params[:latest]
    @item = Item.latest
    elsif params[:old]
    @item = Item.old
    elsif params[:favorites_count]
    @item = Item.favorites_count
    elsif params[:star_count]
    @item = Item.star_count
    else
    @item = Item.all
    end

    @user = current_user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save!
    redirect_to item_path(@item.id)
    else
    @items = Item.all
    render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     redirect_to item_path(@item.id)
    else
     @items = Item.all
     render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :star, :video, images: [])
  end

end
