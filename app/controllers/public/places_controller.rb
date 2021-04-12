class Public::PlacesController < ApplicationController
  before_action :authenticate_user!
  def index
    @place = Place.page(params[:page]).per(5) #kaminari
    @place_all = Place.all
    @region = Region.all #地域名表示
    if params[:name].present?
    @region = @region.get_by_name params[:name]
    end
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
    @place_comments = @place.place_comments.order(created_at: :desc)  #新着順
  end

end
