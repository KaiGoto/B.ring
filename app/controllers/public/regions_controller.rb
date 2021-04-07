class Public::RegionsController < ApplicationController
  def index
    @region = Region.all
    @region_all = Region.all
  end

  def show
    @regions = Region.find(params[:id])
     @place = Place.all
  end

  private
  def region_params
    params.require(:region).permit(:name)
  end

end
