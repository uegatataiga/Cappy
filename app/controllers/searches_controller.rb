class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User" #検索ワードがuserの場合
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(8)
    else #userでない場合(item)の場合
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
    end
  end
end

