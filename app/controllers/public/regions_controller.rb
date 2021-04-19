class Public::RegionsController < ApplicationController
  def index
    @region = Region.all
    @regions = Region.new
    @region_all = Region.all
  end

  def show
    @regions = Region.find(params[:id])
    @place_all = Place.all
    if params[:address].present?
      @region = @region.get_by_address params[:address]
    end
  end

end
