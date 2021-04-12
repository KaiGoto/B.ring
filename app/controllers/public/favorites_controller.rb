class Public::FavoritesController < ApplicationController
  before_action :set_place
  def create
    place = Place.find(params[:place_id])
    favorite = current_user.favorites.new(place_id: place.id)
    favorite.save
  end

  def destroy
    @place = Place.find(params[:place_id])
    favorite = current_user.favorites.find_by(place_id: @place.id)
    favorite.destroy
  end

  private
  def set_place
    @place = Place.find(params[:place_id])
  end

end
