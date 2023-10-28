class HomesController < ApplicationController
  def new_items
  @newitem = Item.order(created_at: :desc).limit(4)
  end

end
