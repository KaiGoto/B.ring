class Admins::PlaceCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @place_comment = PlaceComment.find(params[:id]).destroy
    @place_comment.destroy
    redirect_to request.referer
  end
end
