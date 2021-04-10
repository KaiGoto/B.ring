class Public::PlacesController < ApplicationController
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
  end

end
