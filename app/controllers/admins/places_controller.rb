class Admins::PlacesController < ApplicationController
before_action :authenticate_admin!
  def new
    @place = Place.new
    @places = Place.all
    @region = Region.new
  end

  def index
    # kaminari
    @place = Place.page(params[:page]).per(5)
    @place_all = Place.all
    @region = Region.all
    # 地域名受け渡し
    if params[:name].present?
      @region = @region.get_by_name params[:name]
    end
    # ランキング機能,いいね数に基づいた順
    @places = Place.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @place_kaminari = Kaminari.paginate_array(@places).page(params[:page]).per(5)
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
    @place_comments = @place.place_comments.order(created_at: :desc)  #新着順
    @place_comment_kaminari = PlaceComment.page(params[:page]).per(5) #kaminari
  end

  def edit
    @place = Place.find(params[:id])
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

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:notice] ='Place was successfully created.'
    redirect_to admins_places_path
  end

  private
  def place_params
    params.require(:place).permit(:image, :name, :explanation, :region_id, :ground, :address)
  end

end
