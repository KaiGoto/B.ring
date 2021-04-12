class Public::PlaceCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @place = Place.find(params[:place_id])
    comment = current_user.place_comments.build(place_comment_params)
    comment.place_id = @place.id
    comment.save
    @place_comment = PlaceComment.new
  end

  def destroy
    @place = Place.find(params[:place_id])
    @place_comment = PlaceComment.find(params[:id]).destroy
    @place_comment.destroy
  end

  private
  def place_comment_params
    params.require(:place_comment).permit(:comment, :user_id, :place_id)
  end
end
