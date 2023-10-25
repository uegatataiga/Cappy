class GenresearchesController < ApplicationController

  def genre_search
    @genre_id = params[:genre_id]
    @item = Item.where(genre_id: @genre_id)
    @item = Kaminari.paginate_array(@item).page(params[:page]).per(8)
  end

end
