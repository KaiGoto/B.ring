class Admins::RegionsController < ApplicationController
before_action :authenticate_admin!
  def index
    @region = Region.all
    @regions = Region.new
    @region_all = Region.all
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to admins_region_path(@region)
    else
      render "index"
    end
  end

  def show
    @region = Region.find(params[:id])
    @place = Place.new
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      redirect_to admins_regions_path
    else
      render "edit"
    end
  end

  private
  def region_params
    params.require(:region).permit(:name)
  end
end
