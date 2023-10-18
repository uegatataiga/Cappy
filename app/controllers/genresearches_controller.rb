class GenreSearchesController < ApplicationController

  def genre_search
    @genre_id = params[:genre_id]
    @item = Item.where(genre_id: @genre_id)
  end

end
