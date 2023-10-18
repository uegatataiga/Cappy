class SearchesController < ApplicationController

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
    else
      @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end
end

