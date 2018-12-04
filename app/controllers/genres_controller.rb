class GenresController < ApplicationController
  before_action :set_genre, only:[:show,:edit,:update,:destroy]
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private
  def genre_params
    genre_params = params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = genre.find(params[:id])
  end

end
