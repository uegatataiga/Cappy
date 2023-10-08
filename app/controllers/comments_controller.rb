class CommentsController < ApplicationController

  def create
    @items = Item.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.item_id = @items.id
    @comment.save

  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    @comment.destroy
    @items = Item.find(params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :profile_image)
  end

end
