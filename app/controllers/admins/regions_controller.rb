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
      redirect_to admins_region_path(@region), notice: '地域を作成しました'
    else
      render "index"
    end
  end

  def show
    @region = Region.find(params[:id])
    @place = Place.all
  end

  def edit
    @region = Region.find(params[:id])
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(region_params)
      redirect_to admins_regions_path, notice: '更新しました'
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
