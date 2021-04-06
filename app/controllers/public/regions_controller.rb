class Public::RegionsController < ApplicationController
  def index
    @region = Region.all
  end

  def show
    @regions = Region.find(params[:id])
  end

  private
  def region_params
    params.require(:region).permit(:name)
  end

end
