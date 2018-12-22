class MovieSearchesController < ApplicationController
  def new
    @moviesearch = MovieSearch.new
    @genres = Genre.pluck(:name)
  end

  def create
    @moviesearch = MovieSearch.create(moviesearch_params)
      redirect_to @moviesearch
  end

  def show
    @moviesearch = MovieSearch.find(params[:id])
  end

  private
  def moviesearch_params
    params.require(:movie_search).permit(:keywords, :genre, :director,:min_length, :max_length)
  end
end
