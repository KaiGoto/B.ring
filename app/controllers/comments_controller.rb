class CommentsController < ApplicationController

  def create
    place = Place.find(params[:place_id])
    comment = current_user.comments.new(comment_params)
    comment.place_id = place.id
    comment.save
    redirect_to place_path(place)
  end
  def destroy
    Comment.find_by(id: params[:id], place_id: params[:place_id]).destroy
    redirect_to place_path(params[:place_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
