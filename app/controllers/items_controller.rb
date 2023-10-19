class ItemsController < ApplicationController
     before_action :authenticate_user!

  def new
    if Item.where(user_id:current_user.id,rakuten_code:params[:rakuten_code]).count == 0
      @item = Item.new(rakuten_image:params[:rakuten_image][0],rakuten_name:params[:rakuten_name],rakuten_url:params[:rakuten_url],rakuten_introduction:params[:rakuten_introduction],rakuten_code:params[:rakuten_code])
    else
      flash.now[:alert] = "この商品は投稿済みです。"
      redirect_to request.referer
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @comment = Comment.new
  end

  def index
    if params[:latest]
    @item = Item.latest.page(params[:page]).per(8)
    elsif params[:old]
    @item = Item.old.page(params[:page]).per(8)
    elsif params[:favorites_count]
    @item = Item.favorites_count.page(params[:page]).per(8)
    elsif params[:star_count]
    @item = Item.star_count.page(params[:page]).per(8)
    else
    @item = Item.page(params[:page]).per(8)
    end

    @user = current_user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
    flash[:notice] = "投稿に成功しました。"
    redirect_to item_path(@item.id)
    else
    @items = Item.all
    render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     flash[:notice] = "更新に成功しました。"
     redirect_to item_path(@item.id)
    else
     @items = Item.all
     render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def search
    if params[:keyword]
      @item = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :star, :genre_id, :video,:rakuten_image, :rakuten_name, :rakuten_url, :rakuten_introduction,:rakuten_code,images: [])
  end

end
