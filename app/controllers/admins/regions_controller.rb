class Admins::RegionsController < ApplicationController
before_action :authenticate_admin!
  def index
    @region = Region.all
    @regions = Region.new
    @region_all = Region.all
  end

  def create
    @regions = Region.new(region_params)
    if @regions.save
      redirect_to admins_region_path(@region)
    else
      @region = Region.all
      render "index"
    end
  end

  def show
    @region = Region.find(params[:id])
    @place = Place.all
    # 場所の住所受け渡し
    if params[:address].present?
      @region = @region.get_by_address params[:address]
    end
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

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    flash[:notice] ='Region was successfully created.'
    redirect_to admins_regions_path
  end

  private
  def region_params
    params.require(:region).permit(:name)
  end
end
