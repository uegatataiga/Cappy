class HomesController < ApplicationController
  def top
    @item = Item.all
    @ramdom = Item.order(sort_at: :desc).limit(4)
  end
end
