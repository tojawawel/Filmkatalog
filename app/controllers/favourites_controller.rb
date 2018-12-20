class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def update
    favourite = Favourite.where(movie: Movie.find(params[:movie]), user: current_user)
    if favourite.empty?
      Favourite.create(movie: Movie.find(params[:movie]), user: current_user)
      @favourite_exists = true
    else
      favourite.destroy_all
      @favourite_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
