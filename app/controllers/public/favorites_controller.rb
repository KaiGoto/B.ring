class Public::FavoritesController < ApplicationController
  def create
    place = Place.find(params[:place_id])
    favorite = current_user.favorites.new(place_id: place.id)
    favorite.save
    redirect_to place_path(place)
  end
  def destroy
    place = Place.find(params[:place_id])
    favorite = current_user.favorites.find_by(place_id: place.id)
    favorite.destroy
    redirect_to place_path(place)
  end

end
