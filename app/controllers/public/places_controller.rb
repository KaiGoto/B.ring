class Public::PlaceController < ApplicationController
  def index
    @place = Place.page(params[:page]).per(5) #kaminari
    @region = Region.all #地域名表示
    if params[:name].present?
    @region = @region.get_by_name params[:name]
    end
  end

  def show
    @place = Place.find(params[:id])
  end

end
