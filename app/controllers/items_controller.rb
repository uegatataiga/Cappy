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
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
