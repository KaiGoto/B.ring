class Admins::PlacesController < ApplicationController
before_action :authenticate_admin!
  def index
    @place = Place.page(params[:page]).per(10)
    @region = Region.all
    if params[:name].present?
      @region = @region.get_by_name params[:name]
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
    @places = Place.all
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to admins_place_path(@place)
    else
      render "new"
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      redirect_to admins_place_path
    else
      render "edit"
    end
  end

  private
  def place_params
    params.require(:place).permit(:image_id, :name, :explanation, :region, :ground)
  end

end