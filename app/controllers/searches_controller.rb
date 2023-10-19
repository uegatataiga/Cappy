class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(8)
    else
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
    end
  end
end

