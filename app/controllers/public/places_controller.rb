class Public::PlacesController < ApplicationController
  def index
    # ランキング機能
    # いいね数に基づいた
    @places = Place.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @place = Kaminari.paginate_array(@places).page(params[:page]).per(5)
    @place_all = Place.all
    @region = Region.all 
    #地域名表示
    if params[:name].present?
    @region = @region.get_by_name params[:name]
    end
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
    @place_comments = @place.place_comments.order(created_at: :desc).page(params[:page]).per(5)  #新着順
  end

end
